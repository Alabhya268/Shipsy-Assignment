import 'package:flutter/material.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class KVStringWidget extends StatelessWidget {
  const KVStringWidget({
    super.key,
    this.value,
    this.keyString,
  });

  final String? value;
  final String? keyString;

  @override
  Widget build(BuildContext context) {
    return value?.isEmpty ?? false
        ? Container()
        : RichText(
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  style: context.constantUi.boldTextStyle2,
                  text: keyString,
                ),
                TextSpan(
                  style: context.constantUi.lightTextStyle,
                  text: value,
                ),
              ],
            ),
          );
  }
}
