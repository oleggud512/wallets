import 'package:ads_pay_app/src/features/tags/domain/entities/tag.dart';
import 'package:ads_pay_app/src/features/wallets/domain/entities/wallet.dart';
import 'package:firebase_database/firebase_database.dart';

class Account {
  List<Tag> tags;
  List<Wallet> wallets;

  Account({
    required this.tags,
    required this.wallets
  });

  factory Account.empty() {
    return Account(
      tags: [],
      wallets: []
    );
  }

  factory Account.fromDataSnapshot(DataSnapshot snapshot) {
    /*
      uid: {
        wallets: {
          wid: {
            date-creation:
            last-updated:
            amount:
            currency:
            description:
            history: {
              hid: {
                date:
                amount:
                action:
                description:
                tid:
              }
              ...
            }
          },
          ...
        },
        tags: {
          tid: {
            color:
          }
          ...
        }
      }
    */
    return Account(
      wallets: snapshot.hasChild('wallets')
        ? () {
          List<Wallet> wallets = snapshot.child('wallets').children.map(
            (ws) => Wallet.fromDataSnapshot(ws)
          ).toList();
          wallets.sort((a, b) => b.lastUpdated.compareTo(a.lastUpdated));
          return wallets;
        }()
        : [],
      tags: snapshot.hasChild('tags') 
        ? snapshot.child('tags').children.map((ws) => Tag.fromDataSnapshot(ws)).toList()
        : []
    );
  }
}