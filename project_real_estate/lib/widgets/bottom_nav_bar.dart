import 'package:flutter/material.dart';
import 'package:project_real_estate/design/colors/colors.dart';
import 'package:project_real_estate/screens/houses.dart';
import 'package:project_real_estate/screens/info.dart';

class BottomNavigatorBarScreen extends StatefulWidget {
  final List<Map<String, dynamic>> houseList;

  const BottomNavigatorBarScreen({Key? key, required this.houseList})
      : super(key: key);

  @override
  State<BottomNavigatorBarScreen> createState() =>
      _BottomNavigatorBarScreenState();
}

class _BottomNavigatorBarScreenState extends State<BottomNavigatorBarScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: IndexedStack(
        index: pageIndex,
        children: [
          HousesScreen(
            houseList: widget.houseList,
          ),
          const InfoScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.lightGray, // Background color of the bottom bar
          boxShadow: [
            BoxShadow(
              color: AppColors.light, // Shadow color
              blurRadius: 1, // Shadow's blur radius
              spreadRadius: 5, // Shadow's spread radius
              offset: Offset(0, 3), // Shadow's offset (x, y)
            )
          ],
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Homes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
          elevation: 100,
          selectedItemColor: AppColors.strong,
          unselectedItemColor: AppColors.light,
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
        ),
      ),
    );
  }
}
