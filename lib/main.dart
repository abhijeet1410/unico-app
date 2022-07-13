import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/configs/theme_configs/theme_config.dart';
import 'package:get/get.dart';
import 'configs/page_routes.dart';
import 'pages/splash/splash_page.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      localizationsDelegates: [
        // S.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate
      ],
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      getPages: AppPageRoutes.routes,
      initialRoute: SplashPage.routeName,
    );
  }
}
