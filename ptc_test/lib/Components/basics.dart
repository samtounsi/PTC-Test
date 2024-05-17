import 'package:flutter/material.dart';

import '../Style/colors.dart';

Widget text(
  String data, {
  double size = 16,
  Color color = Colors.black,
  FontWeight? weight = FontWeight.w400,
  String? fontFamily = 'Poppins',
  FontStyle? fontStyle,
  double? letterSpacing,
  double? height,
  TextAlign? textAlign,
}) {
  return Text(
    data,
    style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        height: height),
    textAlign: textAlign,
  );
}

Widget baseButton({
  required void Function() onPressed,
  String title = 'Button',
  double? round = 19,
  Color titleColor = Colors.white,
  Color boxColor = green,
  double height = 60,
  double width = 300,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: boxColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
    ),
    child: text(title,
        fontFamily: 'Poppins',
        size: 18,
        weight: FontWeight.w400,
        color: titleColor),
  );
}

Widget baseIconButton({
  required void Function() onPressed,
  required IconData icon,
  Color iconColor = Colors.white,
  Color boxColor = green,
  BorderSide side = BorderSide.none,
  double size = 25,
}) {
  return IconButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: boxColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17), side: side),
    ),
    icon: Icon(
      icon,
      color: iconColor,
      size: size,
    ),
  );
}

Widget textField({
  String? label,
}) {
  return TextField(
    decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(124, 124, 124, 1)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromRGBO(123, 123, 123, 0.3),
        ))),
  );
}
