import 'package:cross_word_games/core/themes/custom_colors.dart';
import 'package:cross_word_games/core/themes/custom_textstyle.dart';
import 'package:flutter/material.dart';

/// @author: Sagar KC
/// @email: sagar.kc@fonepay.com
/// @created_at:  12/6/2022, Tuesday

class PuzzleContainer extends StatelessWidget {
  const PuzzleContainer(
      {Key? key,
      required this.value,
      required this.isFilled,
      this.containerColor})
      : super(key: key);
  final String value;
  final bool isFilled;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: !isFilled
              ? Colors.grey.withOpacity(0.6)
              : containerColor ?? CustomColors.containerColorOrange),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Center(
        child: Text(
          isFilled ? value : '',
          style: CustomTextStyle.containerTextStyle,
        ),
      ),
    );
  }
}
