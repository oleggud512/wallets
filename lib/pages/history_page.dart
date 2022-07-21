import 'package:ads_pay_app/models/history_node.dart';
import 'package:ads_pay_app/models/wallet.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/account.dart';
import '../widgets/history_node_widget.dart';


class HistoryPage extends StatefulWidget {
  HistoryPage({
    Key? key,
    required this.walletId
  }) : super(key: key);

  String walletId;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}
/* Это действительно могло бы быть хорошей идеей... Но я не собираюсь 
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

class _HistoryPageState extends State<HistoryPage> {
  late DatabaseService dbServ;
  late Stream<Account> accountStream;

  @override
  void initState() {
    super.initState();
    dbServ = context.read<DatabaseService>();
    accountStream = dbServ.getAccountStream();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Account>(
      stream: accountStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Account account = snapshot.data!;
          Wallet curWallet = account.wallets
              .firstWhere((w) => w.wid == widget.walletId);
          return Scaffold(
            appBar: AppBar(
              title: Text(curWallet.description.replaceAll('\n', ' '))
            ),
            body: ListView(
              children: [
                for (HistoryNode hn in curWallet.history) HistoryNodeWidget(
                  historyNode: hn,
                  tags: account.tags,
                  wid: curWallet.wid,
                  weirdCallback: () {}
                )
              ]
            ),
          );
        }
        return buildLoading();
      }
    );
  }

  Widget buildLoading() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: const Center(
        child: CircularProgressIndicator()
      )
    );
  }
}