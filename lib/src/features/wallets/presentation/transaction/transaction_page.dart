import 'package:ads_pay_app/ad_options.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tags_dialog.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/wallet.dart';
import '../../../tags/presentation/tag_widget.dart';


@RoutePage()
class TransactionPage extends StatefulWidget {
  const TransactionPage({
    Key? key,
    required this.action, 
    required this.wallet,
  }) : super(key: key);

  final WalletAction action;
  final Wallet wallet;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late DatabaseService dbServ;
  late HistoryNode historyNode;

  InterstitialAd? intAd;
  late BannerAd banAd;

  GlobalKey<FormFieldState> amountKey = GlobalKey<FormFieldState>();
  late Tag curTag;
  TextEditingController amountCont = TextEditingController();
  String get walletId => widget.wallet.wid;

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
    historyNode = HistoryNode.empty(widget.action);
    curTag = Tag.initial(widget.action)..name = 'Choose category'.hardcoded;
    loadIntAd();
    loadBanAd();
  }

  loadIntAd() {
    InterstitialAd.load(
      adUnitId: AdDefaultOptions.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {

            }
          );
          intAd = ad;
          // print('req\nreq\n\nreq\nreq\n');
        },
        onAdFailedToLoad: (err) {
          // print('asdf\nasdf\n${err.message}\nasdf\nasdf\n');
        },
      )
    );
  }

  loadBanAd() {
    banAd = BannerAd(
      adUnitId: AdDefaultOptions.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // print('mumu\nmumu\n\nmumu\nmumu\n');
          setState(() {});
        },
        onAdFailedToLoad: (ad, err) {
          // print('haha\nhaha\n${err.message}\nhaha\nhaha\n');
          ad.dispose();
        },
      ),
    );
    banAd.load();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.action.name.toUpperCase()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (banAd.responseInfo != null)
                SizedBox(
                  height: 50,
                  child: AdWidget(ad: banAd),
                ),
              h8gap,
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  Tag? tag = await showDialog(
                    context: context,
                    builder: (_) => TagsDialog(action: widget.action),
                  );
                  if (tag != null) {
                    setState(() {
                      historyNode.tagName = tag.name;
                      curTag = tag;
                    });
                  }
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: TagWidget(
                    tag: curTag
                  )
                ),
              ),
              h8gap,
              TextFormField(
                key: amountKey,
                controller: amountCont,
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  historyNode.amount = double.parse(v.replaceAll(',', '.'));
                },
                validator: (v) {
                  double val = double.parse(v!.isEmpty ? '0' : v);
                  if (val <= 0) {
                    return 'Enter another value'.hardcoded; 
                  } else if (widget.action == WalletAction.take && val > widget.wallet.amount) {
                    return 'Too much. Available: ${widget.wallet.amount} ${widget.wallet.currency}.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Amount'.hardcoded
                ),
              ),
              h8gap,
              SizedBox(
                height: 200,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  maxLength: 255,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                    labelText: 'Description'.hardcoded,
                    alignLabelWithHint: true,
                  ),
                  onChanged: (v) {
                    historyNode.description = v;
                  },
                ),
              ),
              ElevatedButton(
                child: Text(widget.action.name.toUpperCase()),
                onPressed: () async {
                  if (amountKey.currentState!.validate()) {
                    await dbServ.makeTransaction(walletId, historyNode);
                    if (mounted) context.popRoute();
                    intAd?.show().then((v) => intAd?.dispose());
                  }
                },
              ),
            ]
          ),
        ),
      )
    );
  }
}