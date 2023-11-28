import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_real_estate/design/texts.dart';
import 'package:project_real_estate/design/themes.dart';
import 'package:project_real_estate/screens/house_detail.dart';

class HouseDetailWidget extends StatelessWidget {
  const HouseDetailWidget({
    super.key,
    required this.widget,
    required this.houseLocation,
  });

  final HouseDetail widget;
  final LatLng houseLocation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 35, left: 30, right: 30),
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                textApp()
                    .description, // Display a section title for description
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Spacer(),
              Text(
                widget.houseDetails[
                    'description'], // Display the house's description
                style: TextStyles.body,
              ),
              const Spacer(),
              Text(
                textApp().location, // Display a section title for location
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Spacer(),
              SizedBox(
                // Display Google Map with the house's location
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: houseLocation,
                    zoom: 15.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('house'),
                      position: houseLocation,
                    ),
                  },
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
