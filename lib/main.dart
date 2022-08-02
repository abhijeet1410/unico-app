import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_3/configs/theme_configs/theme_config.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:flutter_template_3/configs/page_routes.dart';
import 'package:flutter_template_3/pages/splash/splash_page.dart';
import 'package:flutter_template_3/utils/app_storage_helper.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppStorageHelper.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      getPages: AppPageRoutes.routes,
      initialRoute: SplashPage.routeName,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
