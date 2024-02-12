import 'package:flutter/material.dart';

class ConstantUi {
  Color primaryColor = Colors.redAccent;
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;
  Color blackLightColor = Colors.black12;

  Color blueScreenColor = Colors.blueAccent.shade100;

  double fontSizeSmall1 = 10;
  double fontSizeSmall2 = 12;
  double fontSizeSmall3 = 13;

  double fontSizeMedium1 = 14;
  double fontSizeMedium2 = 16;
  double fontSizeMedium3 = 18;

  double fontSizeLarge1 = 20;
  double fontSizeLarge2 = 22;
  double fontSizeLarge3 = 28;

  ButtonStyle get elevatedButtonStyleOne => ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  TextStyle get boldTextStyle => const TextStyle(fontWeight: FontWeight.bold);

  TextStyle get boldTextStyle1 => TextStyle(
        fontSize: fontSizeMedium3,
        fontWeight: FontWeight.w500,
      );

  TextStyle get boldTextStyle2 => TextStyle(
        color: blackColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSizeMedium2,
      );

  TextStyle get lightTextStyle =>
      TextStyle(color: blackColor, fontSize: fontSizeMedium2);

  TextStyle get headingTextStyle1 => TextStyle(
        fontSize: fontSizeMedium3,
        fontWeight: FontWeight.bold,
      );

  TextStyle headingTextStyle1Fun(Color color) => TextStyle(
        fontSize: fontSizeMedium3,
        fontWeight: FontWeight.bold,
        color: color,
      );
}
