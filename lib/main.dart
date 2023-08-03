import 'package:ads_pay_app/firebase_options.dart';
import 'package:ads_pay_app/services/database_service.dart';
import 'package:ads_pay_app/src/core/presentation/localizations/localization_cubit.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_bloc.dart';
import 'package:ads_pay_app/src/app.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_events.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'src/get_it.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  await MobileAds.instance.initialize();
  
  await configureDependencies();

  // await MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //   testDeviceIds: ['24AD7E1CAC35B81422A086FE47D7C83C'] // oppo cph2239
  // ));
  await MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
    testDeviceIds: ['0ACF006A19621246E5906F26E08A3DE9'] // emulator-5553
  ));
  
  final dbServ = DatabaseService();
  
  final localeCubit = LocaleCubit();
  await localeCubit.load();

  FlutterNativeSplash.remove();
  
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => dbServ),

      BlocProvider(create: (_) => ThemeBloc()..add(ThemeLoadEvent())),
      BlocProvider.value(value: localeCubit),

      ChangeNotifierProvider(create: (_) => getIt<AppRouter>()),
    ],
    child: const MyApp() 
  ));
}