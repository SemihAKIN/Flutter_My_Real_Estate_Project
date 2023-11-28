import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_real_estate/design/colors/colors.dart';

class SvgPictureWidget extends StatelessWidget {
  const SvgPictureWidget({
    super.key,
    required this.iconName,
  });
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/ic_$iconName.svg', // Load an SVG icon based on the provided 'iconName'
      width: 20, // Set the width of the SVG icon
      height: 20, // Set the height of the SVG icon
      color: AppColors.medium, // Set the color of the SVG icon
    );
  }
}
