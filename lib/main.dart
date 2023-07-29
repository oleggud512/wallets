import 'package:ads_pay_app/firebase_options.dart';
import 'package:ads_pay_app/src/features/auth/infrastructure/repositories/firebase_auth_repository_impl.dart';
import 'package:ads_pay_app/services/currency_service.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/services/theme_service.dart';
import 'package:ads_pay_app/src/app.dart';
import 'package:ads_pay_app/src/router.dart';
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
  final dbServ = DatabaseService();
  final authServ = FirebaseAuthRepositoryImpl();
  final curServ = CurrencyService();
  final themeServ = ThemeService();
  final router = AppRouter(authServ);
  
  await themeServ.load();

  FlutterNativeSplash.remove();
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => dbServ),
      Provider(create: (_) => authServ),
      Provider(create: (_) => curServ),
      ChangeNotifierProvider(create: (_) => router),
      ChangeNotifierProvider(create: (_) => themeServ)
    ],
    child: const MyApp() 
  ));
}