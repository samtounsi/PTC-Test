import 'package:flutter/material.dart';
import 'package:ptc_test/Components/basics.dart';
import 'package:ptc_test/Screens/layout.dart';
import 'package:ptc_test/Screens/onboarding.dart';
import 'package:ptc_test/Style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => (onboard ? NavBar() : OnBoarding()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 55,
            height: 55,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/name.svg'),
            text("online groceriet",
                size: 15, fontFamily: 'Gilroy', letterSpacing: 6, color: Colors.white),
          ],
        )
      ]),
    );
  }
}
