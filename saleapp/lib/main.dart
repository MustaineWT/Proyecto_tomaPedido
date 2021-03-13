import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/modules/splash/splash_Binfind.dart';
import 'app/modules/splash/splash_view.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/injection/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      //supportedLocales: [const Locale('en'), const Locale('es')],
      title: 'SALES CIF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
