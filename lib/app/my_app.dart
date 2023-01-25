import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_3/app/core/bindings/initial_binding.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager_impl.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';
import 'package:flutter_template_3/app/modules/splash/presentation/splash_page.dart';
import 'package:flutter_template_3/app/route/app_page_routes.dart';
import 'package:flutter_template_3/firebase_options.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

void mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  PreferenceManager preference =
      Get.put<PreferenceManager>(PreferenceManagerImpl());
  await preference.initStorage();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (!kIsWeb) {
  //   await FirebaseCrashlytics.instance
  //       .setCrashlyticsCollectionEnabled(!kDebugMode);
  // }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runZonedGuarded(() async {
    runApp(const MyApp());
  }, (Object object, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(object, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialBinding: InitialBinding(),
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      getPages: AppPageRoutes.routes,
      initialRoute: SplashPage.routeName,
    );
  }
}
