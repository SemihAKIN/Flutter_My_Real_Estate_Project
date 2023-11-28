import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_real_estate/design/colors/colors.dart';
import 'package:project_real_estate/design/texts.dart';
import 'package:project_real_estate/design/themes.dart';
import 'package:project_real_estate/design/typography/typography.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Expanded(
            flex: 1,
            child: Text(
              textApp().aboutTitle,
              style: TextStyles.textTitle01,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              textApp().about,
              style: TextTypography.textDetail,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              textApp().designAndDevelopment,
              style: TextTypography.textTitle01,
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                InkWell(
                  onTap: _launchDTTWebsite,
                  child: SizedBox(
                    height: 125,
                    width: 250,
                    child: Image.asset("assets/images/dtt_banner.png"),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/ic_dtt.svg',
                  color: AppColors.strong,
                ),
              ],
            ),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}

// Function to launch the DTT website
Future<void> _launchDTTWebsite() async {
  const url = 'https://www.d-tt.nl/en/apps.';

  if (await canLaunchUrl(url as Uri)) {
    await launchUrl(url as Uri);
  } else {
    throw 'Could not launch $url';
  }
}
