import 'package:flutter/material.dart';
import 'package:project_real_estate/design/texts.dart';
import 'package:project_real_estate/design/themes.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70), // Add top margin to the container
      child: Text(
        textApp().title, // Display the title text using the 'textApp' function
        style: TextStyles
            .textTitle01, // Apply the 'textTitle01' text style from the current theme
      ),
    );
  }
}
