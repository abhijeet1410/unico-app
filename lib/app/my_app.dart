import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template_3/app/bindings/initial_binding.dart';
import 'package:flutter_template_3/app/core/values/app_theme.dart';
import 'package:flutter_template_3/app/modules/splash/splash_page.dart';
import 'package:flutter_template_3/app/route/app_page_routes.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';

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
      initialBinding: InitialBinding(),
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      getPages: AppPageRoutes.routes,
      initialRoute: SplashPage.routeName,
    );
  }
}
