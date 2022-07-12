// import 'dart:io';
// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:rxdart/rxdart.dart';

// enum InternetConnection {
//   none,
//   stable
// }

// class InternetConnectionService {
//   InternetConnectionService() {
//     Connectivity().onConnectivityChanged.listen((e) {
//       refreshConnection();
//     });
//   }

//   StreamController<InternetConnection> inetConCont = 
//       BehaviorSubject<InternetConnection>.seeded(InternetConnection.none);
//   Stream<InternetConnection> get inetStateStream => inetConCont.stream;

//   Future<void> refreshConnection() async {
//     if (await hasNetwork()) {
//       inetConCont.sink.add(InternetConnection.stable);
//     } else {
//       inetConCont.sink.add(InternetConnection.none);
//     }
//   }

//   Future<bool> hasNetwork() async {
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       return false;
//     }
//   }
// }