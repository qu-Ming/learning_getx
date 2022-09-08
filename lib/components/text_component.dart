import 'package:flutter/material.dart';
import 'package:learning_getx/utils/const/app_colors.dart';
import 'package:learning_getx/utils/const/app_dimens.dart';

class TextComponent extends StatelessWidget {
  TextComponent(
      {Key? key,
      required this.text,
      this.textSize = AppDimens.text_size_12,
      this.fontWeight = FontWeight.normal,
      this.colorText = AppColors.colorBlack})
      : super(key: key);

  String text;
  double? textSize;
  FontWeight? fontWeight;
  Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: colorText,
          fontSize: textSize,
          fontFamily: 'Poppins',
          fontWeight: fontWeight),
    );
  }
}
