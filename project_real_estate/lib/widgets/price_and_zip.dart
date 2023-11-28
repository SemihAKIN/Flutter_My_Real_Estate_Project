import 'package:flutter/material.dart';
import 'package:project_real_estate/design/themes.dart';
import 'package:project_real_estate/widgets/houses_detail_icons.dart';

class PriceAndZip extends StatelessWidget {
  const PriceAndZip({
    super.key,
    required this.house,
    required this.distance,
  });

  final Map<String, dynamic> house;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // House price
              Text(
                '\$${house['price']}', // Display the house price
                textAlign: TextAlign.left,
                style: TextStyles
                    .textTitle02, // Apply the 'textTitle02' text style from the current theme
              ),

              // House location
              Text(
                house['zip'] +
                    ' ' +
                    house['city'], // Display the house location (zip and city)
                textAlign: TextAlign.left,
                style: TextStyles
                    .detail, // Apply the 'detail' text style from the current theme
              ),

              const Spacer(),

              DetailIcons(
                  house: house,
                  distance:
                      distance) // Display detail icons using the 'DetailIcons' widget
            ],
          ),
        ));
  }
}
