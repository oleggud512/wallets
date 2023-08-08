import 'package:ads_pay_app/src/core/presentation/localization/locale_keys.g.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tag_list_bloc.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tag_list_events.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tag_list_states.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/constants/sizes.dart';
import '../../domain/entities/tag.dart';
import '../tag/tag_widget.dart';

const allTagColors = [
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.limeAccent,
  Colors.yellowAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.grey,
];

@RoutePage(name: 'TagsDialogRoute')
class TagsDialog extends StatelessWidget {
  TagsDialog({
    Key? key,
    required this.action
  }) : super(key: key);

  final WalletAction action;

  final TextEditingController cont = TextEditingController();
  final GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p8)
      ),
      child: SizedBox(
        height: 400,
        width: 400,
        child: BlocProvider(
          create: (_) => TagListBloc(action, getIt(), getIt(), getIt())
            ..add(TagListLoadEvent()),
          child: BlocBuilder<TagListBloc, TagListState>(
            builder: (context, state) {
              final bloc = context.read<TagListBloc>();
              return ListView(
                children: [
                  h16gap,
                  ListTile(
                    title: TextFormField(
                      key: fieldKey,
                      controller: cont,
                      maxLength: 15,
                      onChanged: (name) {
                        bloc.add(TagListNameChangedEvent(name));
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return context.tr(LocaleKeys.promptCategory);
                        } else if (state.tags.map((e) => e.name).contains(val)) {
                          return context.tr(
                            LocaleKeys.categoryAlreadyExistsMessage, 
                            args: [val]
                          );
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: context.tr(LocaleKeys.newCategoryInputHint)
                      ),
                    ),
                  ),
                  if (state.newTagName.isNotEmpty) ListTile(
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        if (fieldKey.currentState!.validate()) {
                          bloc.add(TagListAddTagEvent(() {
                            cont.clear();
                          }));
                        }
                      }
                    ),
                    title: DropdownButton<Color>(
                      value: state.newTagColor,
                      isExpanded: true,
                      items: allTagColors.map(
                        (e) => DropdownMenuItem<Color>(
                          value: e,
                          child: TagWidget(
                            tag: Tag(
                              color: e,
                              name: state.newTagName,
                              action: action
                            )
                          )
                        )
                      ).toSet().toList(),
                      onChanged: (v) {
                        bloc.add(TagListColorChangedEvent(v!));
                      },
                    )
                  ),
                  for (Tag tag in state.tags
                      .where((tag) => tag.action == action)) ListTile(
                    title: TagWidget(tag: tag),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        bool? delete = await YesNoDialog(
                          message: context.tr(LocaleKeys.confirmDeleteCategory, args: [tag.name])
                        ).show(context);
                        if (delete == true) {
                          bloc.add(TagListDeleteTagEvent(tag.name));
                        }
                      },
                    ),
                    onTap: () {
                      context.popRoute(tag);
                    }
                  )
                ]
              );
            }
          ),
        )
      )
    );
  }
}