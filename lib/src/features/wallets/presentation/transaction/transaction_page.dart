import 'package:ads_pay_app/ad_options.dart';
import 'package:ads_pay_app/src/core/common/hardcoded.dart';
import 'package:ads_pay_app/src/core/common/logger.dart';
import 'package:ads_pay_app/src/features/history/domain/entities/history_node.dart';
import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/features/tags/presentation/tags/tags_dialog.dart';
import 'package:ads_pay_app/src/core/common/constants/constants.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/transaction/transaction_page_bloc.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/transaction/transaction_page_events.dart';
import 'package:ads_pay_app/src/features/wallets/presentation/transaction/transaction_page_states.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../get_it.dart';
import '../../domain/entities/wallet.dart';
import '../../../tags/presentation/tag/tag_widget.dart';


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

  InterstitialAd? intAd;
  late BannerAd banAd;

  final amountKey = GlobalKey<FormFieldState>();

  Wallet get wallet => widget.wallet;

  @override
  void initState() {
    super.initState();
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
              glogger.i('int onAdDismissedFullScreenContent');
            }
          );
          intAd = ad;
          glogger.i('int onAdLoaded');
          // print('req\nreq\n\nreq\nreq\n');
        },
        onAdFailedToLoad: (err) {
          glogger.i('int onAdFailedToLoad');
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
          setState(() {});
          glogger.w('ban onAdLoaded');
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          glogger.w('ban onAdFailedToLoad');
        },
      ),
    );
    banAd.load();
  }

  pickTag(BuildContext context) async {
    Tag? tag = await showDialog(
      context: context,
      builder: (_) => TagsDialog(action: widget.action),
    );

    if (!mounted || tag == null) return;
    context.read<TransactionPageBloc>()
      .add(TransactionPageTagChangedEvent(tag));
  }

  makeTransaction(BuildContext context) async {
    if (amountKey.currentState!.validate()) {
      context.read<TransactionPageBloc>()
        .add(TransactionPageMakeTransactionEvent());
      if (mounted) context.popRoute();
      intAd?.show()
        .then((v) => intAd!.dispose());
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionPageBloc(getIt(), wallet.wid, widget.action),
      child: BlocBuilder<TransactionPageBloc, TransactionPageState>(
        builder: (context, state) {
          final bloc = context.read<TransactionPageBloc>();
          glogger.d('build ${state.tag?.name}');
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
                    buildTagPicker(context, state.tag),
                    h8gap,
                    TextFormField(
                      key: amountKey,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        bloc.add(TransactionPageAmountChangedEvent(double.parse(v.replaceAll(',', '.'))));
                      },
                      validator: (v) {
                        double val = double.parse(v!.isEmpty ? '0' : v);
                        if (val <= 0) {
                          return 'Enter another value'.hardcoded; 
                        } else if (widget.action == WalletAction.take 
                            && val > wallet.amount) {
                          return 'Too much. Available: ${wallet.amount} ${wallet.currency}.';
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
                          bloc.add(TransactionPageDescriptionChangedEvent(v));
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => makeTransaction(context),
                      child: Text(widget.action.name.toUpperCase()),
                    ),
                  ]
                ),
              ),
            )
          );
        }
      ),
    );
  }

  Widget buildTagPicker(BuildContext context, Tag? tag) {
    return InkWell(
      borderRadius: BorderRadius.circular(p8),
      onTap: () => pickTag(context),
      child: Container(
        height: p56,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(p8)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerLeft,
        child: TagWidget(
          tag: tag ?? Tag(
            action: widget.action, 
            name: 'Choose category'.hardcoded
          )
        )
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    banAd.dispose();
  }
}