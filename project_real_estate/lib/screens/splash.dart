import 'package:flutter/material.dart';
import 'package:project_real_estate/design/colors/colors.dart';
import 'package:project_real_estate/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  final List<Map<String, dynamic>> houseList;

  const SplashScreen({Key? key, required this.houseList}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delayed navigation to the main screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigatorBarScreen(
            houseList: widget.houseList, // We pass the real houseList data
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.red,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/launcher_icon.png"),
        ),
      ),
    );
  }
}
