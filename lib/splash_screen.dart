
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:jc_music_app_flutter/Pages/home_page.dart';
import 'package:lottie/lottie.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust width as needed
              height: MediaQuery.of(context).size.height *
                  0.5, // Adjust height as needed
              child: LottieBuilder.asset(
                  "assets/animations/Animation - 1724118161705.json"),
            ),
          ),
        ],
      ),
      nextScreen: const HomePage(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      splashIconSize: double
          .infinity, // This ensures the splash animation takes full screen
    );
  }
}
