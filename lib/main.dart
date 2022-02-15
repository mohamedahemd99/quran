import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/provider_quraan.dart';

import 'adMob.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  MobileAds.instance.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => QuranProvider()..getQuranAudioAndText()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdMobScreen(),
    );
  }
}
