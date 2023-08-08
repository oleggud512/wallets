import 'package:ads_pay_app/src/features/history/presentation/history/history_page_bloc.dart';
import 'package:ads_pay_app/src/features/history/presentation/history/history_page_events.dart';
import 'package:ads_pay_app/src/features/history/presentation/history/history_page_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/constants/sizes.dart';
import '../../../../get_it.dart';
import '../history_node/history_node_widget.dart';

/* 
  Это действительно могло бы быть хорошей идеей... Но я не собираюсь 
  переписывать рабочий код. Скорее всего тут такое решение и не нужно, 
  потому что вряд-ли один и тот же пользователь создат миллион узлов, 
  какими бы они не были...
 
  accounts: {
    uid1: {
      tags: {
        tag1: {
          color: 2345678099,
          action: add
        },
        tag2: { ... } 
      }
    },
    uid2: { ... }
  },
  
  wallets: {
    uid1: {
      wid1: {
        amount: 5000,
      }
    },
    uid2: {
      wid3: {
        am: 4444,
      }
    }
  },

  history: {
    wid1: {
      hid1: {
        category: cid1,
        amount: 30,
        action: take
      }
    }
  }

  category: {
    uid1: {
      cid1: {
        name: first,
        color: 3939394943,
        action: take,
      },
    }
  }

*/
@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({
    Key? key,
    required this.walletId
  }) : super(key: key);

  final String walletId;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryPageBloc(walletId, getIt(), getIt())
        ..add(HistoryPageLoadEvent()),
      child: BlocBuilder<HistoryPageBloc, HistoryPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.wallet.description.replaceAll('\n', ' '))
            ),
            body: ListView(
              padding: const EdgeInsets.all(p8),
              children: state.wallet.history.map(
                (hn) => Padding(
                  padding: const EdgeInsets.only(top: p8), 
                  child: HistoryNodeWidget(
                    historyNode: hn, 
                    allTags: state.tags,
                    walletId: walletId
                  )
                )
              ).toList()
            ),
          );
        }
      ),
    );
  }
}