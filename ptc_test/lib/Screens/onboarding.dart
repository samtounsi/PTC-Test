import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ptc_test/Screens/layout.dart';
import 'package:ptc_test/Style/colors.dart';
import '../Components/basics.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/landingImage.jpeg',
              ),
              fit: BoxFit.cover,
              alignment: Alignment(0.2, 0),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 56,
                  width: 48,
                ),
                SizedBox(
                  height: 25,
                ),
                text(
                  'Welcome\n to our store',
                  fontFamily: 'Poppins',
                  weight: FontWeight.w400,
                  size: 48,
                  textAlign: TextAlign.center,
                  height: 1.1,
                  color: Colors.white,
                ),
                text(
                  'Get our groceries in as fast as one hour',
                  fontFamily: 'Poppins',
                  weight: FontWeight.w400,
                  size: 16,
                  color: Color.fromARGB(178, 252, 252, 252),
                ),
                SizedBox(
                  height: 30,
                ),
                baseButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ),
                    );
                    onboard = true;
                  },
                  title: 'Get Started',
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
