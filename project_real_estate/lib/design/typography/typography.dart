import 'package:flutter/material.dart';
import 'package:project_real_estate/design/colors/colors.dart';

class TextTypography {
  static const TextStyle textTitle01 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  static const TextStyle textTitle02 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static const TextStyle textTitle03 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
  static const TextStyle textBody = TextStyle(
      fontFamily: 'BookFont', fontWeight: FontWeight.normal, fontSize: 12);
  static const TextStyle textInput = TextStyle(
      fontFamily: 'BookFont', fontWeight: FontWeight.bold, fontSize: 12);
  static const TextStyle textHint =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 12);
  static const TextStyle textSubtitle = TextStyle(
      fontFamily: 'BookFont',
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: AppColors.light);
  static const TextStyle textDetail = TextStyle(
      fontFamily: 'BookFont',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppColors.medium);
}
