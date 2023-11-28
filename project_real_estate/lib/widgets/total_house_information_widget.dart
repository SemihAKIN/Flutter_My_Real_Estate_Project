import 'package:flutter/material.dart';
import 'package:project_real_estate/screens/house_detail.dart';
import 'package:project_real_estate/widgets/house_icons_widget.dart';

class TotalHouseInformation extends StatelessWidget {
  const TotalHouseInformation({
    super.key,
    required this.widget,
  });

  final HouseDetail widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      width: double.infinity,
      child:
          // Display house price, bedrooms, bathrooms, size, and distance
          HouseIconsWidget(
        widget: widget,
      ),
    );
  }
}
