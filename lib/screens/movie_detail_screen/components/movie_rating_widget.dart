import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class MovieRatingWidget extends StatelessWidget {
  const MovieRatingWidget({
    super.key,
    required this.voteStars,
  });

  final double voteStars;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: voteStars,
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
      ),
      starCount: 10,
      starSize: 20,
      valueLabelTextStyle: context.constantUi.boldTextStyle2,
      maxValue: 10,
      starColor: context.constantUi.primaryColor,
    );
  }
}
