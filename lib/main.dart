import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guessing_game/ui/intro_screen/intro_screen.dart';

import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            surfaceTintColor: MaterialStateProperty.all(AppColors.whiteColor),
            splashFactory: NoSplash.splashFactory
          )
        ),
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}

