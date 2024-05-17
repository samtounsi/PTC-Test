import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptc_test/Components/basics.dart';
import 'package:ptc_test/Screens/layout.dart';
import 'package:ptc_test/Style/colors.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset('assets/images/successful.svg'),
            SizedBox(height: 10),
            text('Your Order has been accepted',
                size: 28, textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: text(
                  'Your items has been placcd and is on it’s way to being processed',
                  color: gray,
                  textAlign: TextAlign.center),
            ),
            Spacer(),
            baseButton(
              onPressed: () {},
              title: 'Track Order',
              width: MediaQuery.of(context).size.width - 30,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                    (route) => false);
              },
              child: text(
                'Back To Home',
                size: 18,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
