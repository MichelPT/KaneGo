import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:michel_money/screens/home_screen.dart';
import 'package:michel_money/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('transactions');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return GetMaterialApp(
            title: 'Michel\'s Money',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Lexend',
              primarySwatch: Colors.lightBlue,
            ),
            home: const SplashScreen());
      },
    );
  }
}
