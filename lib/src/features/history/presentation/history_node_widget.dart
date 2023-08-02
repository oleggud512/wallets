import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/core/presentation/edit_description_dialog.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tag/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/theme/theme_bloc.dart';



class HistoryNodeWidget extends StatefulWidget {
  const HistoryNodeWidget({
    Key? key,
    required this.historyNode, 
    required this.tags,
    required this.wid
  }) : super(key: key);
  
  /// wallet id
  final String wid;
  final HistoryNode historyNode;
  final List<Tag> tags;

  @override
  State<HistoryNodeWidget> createState() => _HistoryNodeWidgetState();
}

class _HistoryNodeWidgetState extends State<HistoryNodeWidget> {
  late DatabaseService dbServ;

  bool isShowAllDescription = false;
  GlobalKey<PopupMenuButtonState> popupKey = GlobalKey<PopupMenuButtonState>();
  
  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
  }

  onEditHistoryNode() async {
    await showDialog(
      context: context,
      builder: (context) {
        return EditDescriptionDialog(
          hid: widget.historyNode.hid,
          description: widget.historyNode.description,
          wid: widget.wid,
          editDescription: EditDescription.historyNode,
        );
      }
    );
  }

  onDeleteHistoryNode() async {
    bool? delete = await YesNoDialog(
      message: 'Are you sure to delete this record?'.hardcoded
    ).show(context);
    if (delete == true) {
      dbServ.deleteHistoryNode(widget.wid, widget.historyNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          // minHeight: 48,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(p8),
          onLongPress: () {
            popupKey.currentState!.showButtonMenu();
          },
          onTap: () {
            setState(() {
              isShowAllDescription = !isShowAllDescription;
            });
          },
          child: PopupMenuButton<Symbol>(
            key: popupKey,
            enabled: false,
            tooltip: '',
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: #edit,
                  child: Text('edit'.hardcoded)
                ),
                PopupMenuItem(
                  value: #delete,
                  child: Text('delete'.hardcoded)
                )
              ];
            },
            onSelected: (i) async {
              if (i == #edit) onEditHistoryNode();
              if (i == #delete) onDeleteHistoryNode();
            },
            child: Padding(
              padding: const EdgeInsets.all(p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.historyNode.action == WalletAction.add
                          ? '+'
                          : '-'}${widget.historyNode.amount}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: widget.historyNode.action == WalletAction.add
                            ? Colors.green
                            : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                      Text(DateFormat('dd.MM.yyyy, HH:mm').format(
                          widget.historyNode.date),
                        style: Theme.of(context).textTheme.bodyLarge
                      )
                    ]
                  ),
                  if (widget.historyNode.tagName.isNotEmpty) ...[
                    h4gap,
                    TagWidget(
                      tag: widget.tags.firstWhere(
                        (e) => e.name == widget.historyNode.tagName,
                        orElse: () => Tag(
                          action: widget.historyNode.action,
                          name: widget.historyNode.tagName
                        )
                      ),
                    ),
                  ],
                  if (widget.historyNode.description.isNotEmpty) ...[
                    h4gap,
                    Text(widget.historyNode.description,
                      overflow: isShowAllDescription 
                        ? TextOverflow.clip 
                        : TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium
                    )
                  ]
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}