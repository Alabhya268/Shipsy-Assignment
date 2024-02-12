import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class SeatScreenSection extends StatelessWidget {
  const SeatScreenSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.constantUi.blueScreenColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.maxFinite,
      child: Center(
        child: Text(
          "Screen",
          style: context.constantUi.headingTextStyle1,
        ),
      ),
    );
  }
}
