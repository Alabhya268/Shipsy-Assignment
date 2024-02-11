import 'package:flutter/material.dart';

class ConstantUi {
  Color primaryColor = Colors.redAccent;
  Color whiteColor = Colors.white;
  Color blackColors = Colors.black;

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
}
