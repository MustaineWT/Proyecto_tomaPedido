import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'data/datasource/routesdb.dart';
import 'data/models/seller/seller.dart';
import 'data/models/user/user.dart';
import 'data/models/route/routes.dart';

import 'routes/app_pages.dart';
import 'helpers/DependencyInjection.dart';

void main() async {
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SellerAdapter());
  Hive.registerAdapter(RoutesAdapter());
  await DependencyInjection.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void dispose() {
    DependencyInjection.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        Hive.close();
        break;
      case AppLifecycleState.resumed:
        try {
          await Hive.openBox<Routes>(ROUTE,
              compactionStrategy: (entries, deletedEntries) {
            return deletedEntries > 1;
          });
        } catch (e) {
          print(e);
        }
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppPages.INITIAL,
      routes: AppPages.routes,
    );
  }
}
