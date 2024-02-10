import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/pages/home_page.dart';
import 'package:flutter/services.dart';
import 'package:tiger_fortune_app/pages/settings_page.dart';
import 'package:tiger_fortune_app/presentation/screen/spot_slot_page.dart';
import 'package:tiger_fortune_app/pages/spots_page.dart';
import 'package:tiger_fortune_app/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then(
    (value) => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Tiger Fortune',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
        '/spots': (context) => const SpotsPage(),
        '/spotSlot':(context) => FutureBuilder(future: DI.getInstance().init(), builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return const SpotSlotPage();
          } else{
            return const CircularProgressIndicator();
          }
        }),
      },
      initialRoute: '/spotSlot',
    );
  }
}
