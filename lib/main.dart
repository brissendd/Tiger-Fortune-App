import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/presentation/screen/daily_reward_page.dart';
import 'package:tiger_fortune_app/presentation/screen/games/pokies_page.dart';
import 'package:tiger_fortune_app/presentation/screen/games/roulette_page.dart';
import 'package:tiger_fortune_app/presentation/screen/home_page.dart';
import 'package:flutter/services.dart';
import 'package:tiger_fortune_app/presentation/screen/pause_page.dart';
import 'package:tiger_fortune_app/presentation/screen/settings_page.dart';
import 'package:tiger_fortune_app/presentation/screen/games/spotslot_page.dart';
import 'package:tiger_fortune_app/presentation/screen/spots_page.dart';
import 'package:tiger_fortune_app/di.dart';
import 'package:tiger_fortune_app/presentation/screen/win_pages/win_page.dart';

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
        '/': (context) => FutureBuilder(
            future: DI.getInstance().init(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const HomePage();
              } else {
                return const CircularProgressIndicator();
              }
            }),
        '/settings': (context) => const SettingsPage(),
        '/spots': (context) => const SpotsPage(),
        '/spotSlot': (context) => const SpotSlotPage(),
        '/roulette': (context) => const RoulettePage(),
        '/pokies': (context) => const PokiesPage(),        
        '/pause': (context) => const PausePage(),
        '/daily': (context) => const DailyRewardPage(),
        '/win': (context) => const WinPage(),
      },
      initialRoute: '/',
    );
  }
}
