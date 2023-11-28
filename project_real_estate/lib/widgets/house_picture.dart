import 'package:flutter/material.dart';
import 'package:project_real_estate/widgets/price_and_zip.dart';

class Picture extends StatelessWidget {
  const Picture({
    super.key,
    required this.house,
    required this.distance,
  });

  final Map<String, dynamic> house;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: double.infinity,
                  child: Image.network(
                    house[
                        'image'], // Display the house image from the provided URL
                    alignment: Alignment.center,
                    fit: BoxFit.cover, // Fit the image inside its container
                  ),
                ),
              ),
            ),
          ),
          PriceAndZip(
              house: house,
              distance: distance), // Display price and zip information
        ],
      ),
    );
  }
}
