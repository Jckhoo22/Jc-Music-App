import 'package:flutter/material.dart';
import 'package:jc_music_app_flutter/Models/playlist_provider.dart';
import 'package:jc_music_app_flutter/Pages/home_page.dart';
import 'package:jc_music_app_flutter/Themes/dark_mode.dart';
import 'package:jc_music_app_flutter/Themes/light_mode.dart';
import 'package:jc_music_app_flutter/Themes/theme_provider.dart';
import 'package:jc_music_app_flutter/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // Wrap in State Management
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PlaylistProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const Splashscreen(),
    );
  }
}
