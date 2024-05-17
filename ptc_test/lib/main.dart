import 'package:flutter/material.dart';
import 'package:ptc_test/Style/colors.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(124, 124, 124, 1),
              ),
              outlineBorder: BorderSide(
                color: Color.fromRGBO(124, 124, 124, 1),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Color.fromRGBO(124, 124, 124, 0.458),
              ))),
          colorScheme: ColorScheme.fromSeed(seedColor: green),
          useMaterial3: true,
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 12,
                  fontWeight: FontWeight.w600))),
      home: SplashScreen(),
    );
  }
}
