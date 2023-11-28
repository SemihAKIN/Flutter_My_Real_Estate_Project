import 'package:flutter/material.dart';
import 'package:project_real_estate/widgets/icon_text.dart';
import 'package:project_real_estate/widgets/svg_picture_widget.dart';

class DetailIcons extends StatelessWidget {
  const DetailIcons({
    super.key,
    required this.house,
    required this.distance,
  });

  final Map<String, dynamic> house;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.infinity * 0.1,
        child: Row(
          children: [
            // Bedroom icon and count
            const SvgPictureWidget(
              iconName: 'bed',
            ),
            IconText(
              house: house,
              icontext: 'bedrooms',
            ),

            const Spacer(),

            // Bathroom icon and count
            const SvgPictureWidget(
              iconName: 'bath',
            ),
            IconText(
              house: house,
              icontext: 'bathrooms',
            ),

            const Spacer(),

            // House size
            const SvgPictureWidget(
              iconName: 'layers',
            ),
            IconText(
              house: house,
              icontext: 'size',
            ),

            const Spacer(),

            // Distance from user's location
            const SvgPictureWidget(
              iconName: 'location',
            ),
            Text(
              ' ${distance.toStringAsFixed(1)} km',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
