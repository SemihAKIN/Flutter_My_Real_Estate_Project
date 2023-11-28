import 'package:flutter/material.dart';
import 'package:project_real_estate/design/typography/typography.dart';
import 'package:project_real_estate/screens/house_detail.dart';
import 'package:project_real_estate/widgets/svg_picture_widget.dart';

class HouseIconsWidget extends StatelessWidget {
  const HouseIconsWidget({
    super.key,
    required this.widget,
  });

  final HouseDetail widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$ ${widget.houseDetails['price']}', // Display the house price
          style: TextTypography.textTitle01, // Style for the price
          textAlign: TextAlign.left,
        ),
        const Spacer(), // Create spacing between elements
        const Spacer(),
        const Spacer(),
        const SvgPictureWidget(
          iconName: 'bed', // Display a bed icon
        ),
        IconText(
          widget: widget,
          icontext: 'bedrooms', // Display the number of bedrooms
        ),
        const Spacer(),
        const SvgPictureWidget(
          iconName: 'bath', // Display a bathroom icon
        ),
        IconText(
          widget: widget,
          icontext: 'bathrooms', // Display the number of bathrooms
        ),
        const Spacer(),
        const SvgPictureWidget(
          iconName: 'layers', // Display a size (layers) icon
        ),
        IconText(
          widget: widget,
          icontext: 'size', // Display the size of the house
        ),
        const Spacer(),
        const SvgPictureWidget(
          iconName: 'location', // Display a location icon
        ),
        Text(
          '${widget.houseDetails['latitude']} km', // Display the distance from a location
          style: TextTypography.textDetail, // Style for the distance
        ),
        const Spacer(),
      ],
    );
  }
}
