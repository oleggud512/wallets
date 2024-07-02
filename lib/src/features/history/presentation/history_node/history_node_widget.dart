
import 'package:ads_pay_app/src/core/common/constants/other.dart';
import 'package:ads_pay_app/src/core/common/extensions/build_context.dart';
import 'package:ads_pay_app/src/features/history/application/use_cases/update_history_node_description.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/core/presentation/edit_description_dialog.dart';
import 'package:ads_pay_app/src/core/common/constants/sizes.dart';
import 'package:ads_pay_app/src/core/common/extensions/string.dart';
import 'package:ads_pay_app/src/core/presentation/yes_no_dialog.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tag/tag_widget.dart';
import 'package:ads_pay_app/src/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/localization/locale_keys.g.dart';
import '../../application/use_cases/delete_history_node_use_case.dart';


class HistoryNodeWidget extends StatefulWidget {
  const HistoryNodeWidget({
    Key? key,
    required this.historyNode, 
    required this.walletId,
    required this.allTags
  }) : super(key: key);
  
  /// wallet id
  final String walletId;
  final HistoryNode historyNode;
  final List<Tag> allTags;

  @override
  State<HistoryNodeWidget> createState() => _HistoryNodeWidgetState();
}

class _HistoryNodeWidgetState extends State<HistoryNodeWidget> {
  String get walletId => widget.walletId;
  HistoryNode get historyNode => widget.historyNode;
  Tag get tag => widget.allTags.firstWhere(
    (tag) => tag.name == historyNode.tagName, 
    orElse: () => Tag(action: historyNode.action, name: historyNode.tagName)
  );

  GlobalKey<PopupMenuButtonState> popupKey = GlobalKey<PopupMenuButtonState>();

  bool isShowAllDescription = false;

  editHistoryNodeDescription() async {
    final newDescr = await EditDescriptionDialog(
      description: widget.historyNode.description,
    ).show(context);
    if (newDescr == null) return;
    getIt.hardcoded<UpdateHistoryNodeUseCase>()(widget.walletId, widget.historyNode.hid, newDescr);
  }

  onDeleteHistoryNode() async {
    bool? delete = await YesNoDialog(
      message: context.tr(LocaleKeys.confirmDeleteHistoryNode).hardcoded
    ).show(context);

    if (delete != true) return;
    
    getIt<DeleteHistoryNodeUseCase>()(walletId, historyNode.hid);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 48,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(p16),
          onLongPress: () {
            popupKey.currentState!.showButtonMenu();
          },
          onTap: () {
            setState(() {
              isShowAllDescription = !isShowAllDescription;
            });
          },
          child: withPopup(context, 
            child: Padding(
              padding: const EdgeInsets.all(p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHistoryNodeData(context),
                  buildTag(),
                  
                  if (historyNode.description.isNotEmpty) Padding(
                    padding: const EdgeInsets.only(top: p4),
                    child: Text(historyNode.description, 
                      style: context.textTheme?.bodyMedium,
                    )
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget withPopup(BuildContext context, { Widget? child }) {
    return PopupMenuButton<Symbol>(
      key: popupKey,
      enabled: false,
      tooltip: '',
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: #edit,
            child: Text(context.tr(LocaleKeys.edit))
          ),
          PopupMenuItem(
            value: #delete,
            child: Text(context.tr(LocaleKeys.delete))
          )
        ];
      },
      onSelected: (i) async {
        if (i == #edit) editHistoryNodeDescription();
        if (i == #delete) onDeleteHistoryNode();
      },
      child: child
    );
  }

  Widget buildHistoryNodeData(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${historyNode.action == WalletAction.add ? '+' : '-'}${widget.historyNode.amount}',
          style: context.textTheme?.titleLarge?.copyWith(
            color: historyNode.action == WalletAction.add
              ? Colors.green
              : Colors.red,
            // fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        Text(historyNodeDateFormat.format(historyNode.date),
          style: context.textTheme?.bodyLarge
        )
      ]
    );
  }

  Widget buildTag() {
    // TODO: display tag color
    if (historyNode.tagName.isEmpty) return shrink;
    return Padding(
      padding: const EdgeInsets.only(top: p4),
      child: TagWidget(tag: tag)
    );
  }
}