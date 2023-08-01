import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/constants/constants.dart';
import '../../domain/entities/tag.dart';
import '../tag_widget.dart';

@RoutePage(name: 'TagsDialogRoute')
class TagsDialog extends StatefulWidget {
  const TagsDialog({
    Key? key,
    required this.action
  }) : super(key: key);

  final WalletAction action;

  @override
  State<TagsDialog> createState() => _TagsDialogState();
}

class _TagsDialogState extends State<TagsDialog> {
  late DatabaseService dbServ;
  late Stream<List<Tag>> tagsStream;

  TextEditingController cont = TextEditingController();
  GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();
  late Tag tagToAdd;
  bool isAddTag = false;
  List<Color> colors = [];

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
    tagsStream = dbServ.watchTags();
    tagToAdd = Tag(action: widget.action);
    colors.addAll(Colors.accents);
    colors.add(Colors.grey);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p8)
      ),
      child: SizedBox(
        height: 400,
        width: 400,
        child: StreamBuilder<List<Tag>>(
          stream: tagsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {  
              return ListView(
                children: [
                  h16gap,
                  isAddTag 
                    ? ListTile(
                      leading: const Icon(Icons.add),
                      title: Text('Add category'.hardcoded),
                      onTap: () {
                        setState(() {
                          isAddTag = !isAddTag;
                        });
                      },
                    )
                    : ListTile(
                      title: TextFormField(
                        key: fieldKey,
                        controller: cont,
                        maxLength: 15,
                        onChanged: (val) => setState(() => tagToAdd.name = val),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter category name'.hardcoded;
                          } else if (snapshot.data!.map((e) => e.name)
                                                          .contains(val)) {
                            return 'Category "$val" already exists'.hardcoded;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Type to create a new category'.hardcoded
                        ),
                      ),
                    ),
                  if (tagToAdd.name.isNotEmpty) ListTile(
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        if (fieldKey.currentState!.validate()) {
                          dbServ.addTag(tagToAdd);
                        }
                        tagToAdd = Tag(action: widget.action);
                        cont.clear();
                      }
                    ),
                    title: DropdownButton<Color>(
                      value: tagToAdd.color,
                      isExpanded: true,
                      items: colors.map(
                        (e) => DropdownMenuItem<Color>(
                          value: e,
                          child: TagWidget(
                            tag: Tag(
                              color: e,
                              name: tagToAdd.name,
                              action: widget.action
                            )
                          )
                        )
                      ).toSet().toList(),
                      onChanged: (v) {
                        setState(() { tagToAdd.color = v!; });
                      },
                    )
                  ),
                  for (Tag tag in snapshot.data!
                      .where((tag) => tag.action == widget.action)) ListTile(
                    title: TagWidget(tag: tag),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        bool? delete = await YesNoDialog(
                          message: 'Are you sure to delete "${tag.name}" category?'.hardcoded
                        ).show(context);
                        if (delete == true) {
                          dbServ.deleteTag(tag.name);
                        }
                      },
                    ),
                    onTap: () {
                      Navigator.pop(context, tag);
                    }
                  )
                ]
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
        )
      )
    );
  }
}