import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_real_estate/design/colors/colors.dart';
import 'package:project_real_estate/design/typography/typography.dart';
import 'package:project_real_estate/widgets/house_detail_widget.dart';
import 'package:project_real_estate/widgets/total_house_information_widget.dart';

// The HouseDetail class creates the screen for displaying house details.
class HouseDetail extends StatefulWidget {
  const HouseDetail({Key? key, required this.houseDetails}) : super(key: key);
  final Map<String, dynamic> houseDetails;

  @override
  State<HouseDetail> createState() => _DenemDetailState();
}

class _DenemDetailState extends State<HouseDetail> {
  @override
  Widget build(BuildContext context) {
    // Extract latitude and longitude from house details
    final latitude = widget.houseDetails['latitude'];
    final longitude = widget.houseDetails['longitude'];

    LatLng houseLocation = LatLng(latitude, longitude);

    return Scaffold(
      body: Column(
        children: [
          // Display house image and back button
          Stack(
            children: [
              Image.network(
                widget.houseDetails['image'],
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
              const Positioned(
                top: 48,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: BackButton(),
                ),
              ),
              Positioned(
                // Display house details below the image
                bottom: 0,
                left: 0,
                right: 0,
                child: TotalHouseInformation(widget: widget),
              ),
            ],
          ),
          HouseDetailWidget(widget: widget, houseLocation: houseLocation),
        ],
      ),
    );
  }
}

// Back button
class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        'assets/icons/ic_back.svg',
        color: AppColors.lightGray,
      ),
    );
  }
}

// Custom widget for icons and text
class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.widget,
    required this.icontext,
  });

  final HouseDetail widget;
  final String icontext;
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.houseDetails[icontext],
      style: TextTypography.textDetail,
    );
  }
}
