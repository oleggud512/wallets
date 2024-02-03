import 'package:ads_pay_app/firebase_options.dart';
import 'package:ads_pay_app/src/core/common/constants/assets.dart';
import 'package:ads_pay_app/src/core/common/constants/strings.dart';
import 'package:ads_pay_app/src/core/presentation/localization/codegen_loader.g.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_bloc.dart';
import 'package:ads_pay_app/src/app.dart';
import 'package:ads_pay_app/src/core/presentation/theme/theme_events.dart';
import 'package:ads_pay_app/src/router.dart';
import 'package:easy_localization/easy_localization.dart';
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

  // display splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseDatabase.instance.setPersistenceEnabled(true);

  // init ads
  await MobileAds.instance.initialize();
  await MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
    testDeviceIds: [
      '0ACF006A19621246E5906F26E08A3DE9', // emulator-5553
      // '24AD7E1CAC35B81422A086FE47D7C83C', // oppo cph2239
    ],
  ));

  // init dependency injection
  await configureDependencies();
  
  // init localization
  await EasyLocalization.ensureInitialized();

  // remove splash screen when initialization done
  FlutterNativeSplash.remove();
  
  runApp(EasyLocalization(
    supportedLocales: AppLocale.values.map((l) => l.l).toList(),
    path: AppAssets.transaltions,
    fallbackLocale: AppLocale.en.l,
    assetLoader: const CodegenLoader(),
    child: MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc()..add(ThemeLoadEvent())
        ),
        ChangeNotifierProvider(create: (_) => getIt<AppRouter>()),
      ],
      child: const MyApp() 
    ),
  ));
}