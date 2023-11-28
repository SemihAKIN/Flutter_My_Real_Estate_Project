import 'package:flutter/material.dart';
import 'package:project_real_estate/design/colors/colors.dart';

// Define your main theme
ThemeData mainTheme = ThemeData(
  primaryColor: AppColors.lightGray, // Primary color for your theme
  hintColor: AppColors.light, // Hint color for your theme
  textTheme: const TextTheme(
    displayLarge: TextStyles.textTitle01, // Text style for heading 1
    displayMedium: TextStyles.textTitle02, // Text style for heading 2
    displaySmall: TextStyles.textTitle03, // Text style for heading 3
    bodyLarge: TextStyles.body, // Text style for large body text
    bodyMedium: TextStyles.hint, // Text style for medium body text
    bodySmall: TextStyles.detail, // Text style for small body text
    labelSmall: TextStyles.input, // Text style for small labels
  ),
);

// Define a dark theme based on the default dark theme
ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.medium, // Primary color for your dark theme
  hintColor: AppColors.light, // Hint color for your dark theme
  textTheme: const TextTheme(
    displayLarge: TextStyles.textTitle01, // Text style for heading 1
    displayMedium: TextStyles.textTitle02, // Text style for heading 2
    displaySmall: TextStyles.textTitle03, // Text style for heading 3
    bodyLarge: TextStyles.body, // Text style for large body text
    bodyMedium: TextStyles.hint, // Text style for medium body text
    bodySmall: TextStyles.detail, // Text style for small body text
    labelSmall: TextStyles.input, // Text style for small labels
  ),
);

// Define colors with variables

// Define text styles with variables
class TextStyles {
  static const TextStyle textTitle01 = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.strong);

  static const TextStyle textTitle02 = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.strong);

  static const TextStyle textTitle03 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16);

  static const TextStyle body = TextStyle(
      fontFamily: 'BookFont',
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.medium);

  static const TextStyle input = TextStyle(
      fontFamily: 'BookFont',
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.light);

  static const TextStyle hint =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 12);

  static const TextStyle subtitle = TextStyle(
      fontFamily: 'BookFont',
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: AppColors.light);

  static const TextStyle detail = TextStyle(
      fontFamily: 'BookFont',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppColors.medium);

  // You can define other text styles here
}
