import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.house,
    required this.icontext,
  });

  final Map<String, dynamic> house;
  final String icontext;

  @override
  Widget build(BuildContext context) {
    return Text(
      house[
          icontext], // Display a property (e.g., bedrooms, bathrooms, size) value from the 'house' map
      style: Theme.of(context)
          .textTheme
          .bodySmall, // Apply the 'bodySmall' text style from the current theme
    );
  }
}
