import 'package:ads_pay_app/firebase_options.dart';
import 'package:ads_pay_app/pages/splash_page.dart';
import 'package:ads_pay_app/services/auth_service.dart';
import 'package:ads_pay_app/services/currency_service.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:ads_pay_app/test_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  await MobileAds.instance.initialize();
  // await MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //   testDeviceIds: ['24AD7E1CAC35B81422A086FE47D7C83C'] // oppo cph2239
  // ));
  var dbServ = DatabaseService();
  var authServ = AuthService(dbServ);
  var curServ = CurrencyService();
  var themeServ = ThemeService();
  await themeServ.load();

  FlutterNativeSplash.remove();
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => dbServ),
      Provider(create: (_) => authServ),
      Provider(create: (_) => curServ),
      ChangeNotifierProvider(create: (_) => themeServ)
    ],
    child: MyApp() 
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeService>();
    return MaterialApp(
      themeMode: Provider.of<ThemeService>(context).curThemeMode,
      debugShowCheckedModeBanner: false,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      // home: TestWidget(),
      home: SplashPage(),
    );
  }
}
