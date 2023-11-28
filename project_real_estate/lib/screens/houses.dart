import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_real_estate/design/colors/colors.dart';
import 'package:project_real_estate/design/themes.dart';
import 'package:project_real_estate/design/typography/typography.dart';
import 'package:project_real_estate/location/distance.dart';
import 'package:project_real_estate/screens/house_detail.dart';
import 'package:project_real_estate/widgets/house_picture.dart';
import 'package:project_real_estate/widgets/page_title.dart';

// The HousesScreen class creates the main screen for displaying a list of houses.
class HousesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> houseList;

  const HousesScreen({Key? key, required this.houseList}) : super(key: key);

  @override
  State<HousesScreen> createState() => _HousesScreenState();
}

class _HousesScreenState extends State<HousesScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showClearButton = false;
  List<Map<String, dynamic>> filteredHouseList = [];
  double currentLatitude = 0.0;
  double currentLongitude = 0.0;

  @override
  void initState() {
    super.initState();
    filteredHouseList = widget.houseList;
    _controller.addListener(_onTextChanged);
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Handler for text input changes
  Future<void> _onTextChanged() async {
    setState(() {
      _showClearButton = _controller.text.isNotEmpty;
      filterHouses(_controller.text);
    });
  }

  // Filter houses based on search query
  Future<void> filterHouses(String query) async {
    if (query.isEmpty) {
      setState(() {
        filteredHouseList = widget.houseList;
      });
    } else {
      setState(() {
        filteredHouseList = widget.houseList.where((house) {
          return house['city'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  // Clear the search input and reset the filtered list
  void _clearText() {
    setState(() {
      _controller.clear();
      _showClearButton = false;
      filteredHouseList = widget.houseList;
    });
  }

  // Open a bottom sheet to show house details
  void _openHouseDetail(Map<String, dynamic> house) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return HouseDetail(
          houseDetails: house,
        );
      },
    );
  }

  // Get the user's current location using Geolocator
  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          // App title and search input
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App title
                  const PageTitle(),
                  const Spacer(),
                  _buildSearchInput(),
                ],
              ),
            ),
          ),
          _buildHousesList(),
          // Show a message if no search results
          if (_controller.text.isNotEmpty && filteredHouseList.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/search_state_empty.png',
                      alignment: Alignment.center,
                    ),
                  ),
                  const Text(
                    'No results found! \n Perhaps try another search?',
                    textAlign: TextAlign.center,
                    style: TextTypography.textDetail,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Create the widget for the list of houses
  Expanded _buildHousesList() {
    return Expanded(
      flex: 8,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: _buildListViewHouses(),
      ),
    );
  }

  // Create the search input field
  Container _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.darkGray,
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Some Search',
              hintStyle: TextStyles.input,
              suffixIcon: _showClearButton
                  ? IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: _clearText,
                    )
                  : const Icon(Icons.search),
              suffixIconColor: AppColors.medium,
              filled: true,
              fillColor: Colors.transparent,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  // Create the list of houses using a ListView
  ListView _buildListViewHouses() {
    return ListView.builder(
      itemCount: filteredHouseList.length,
      itemBuilder: (context, index) {
        final house = filteredHouseList[index];
        double distance = calculateDistance(
          currentLatitude,
          currentLongitude,
          house['latitude'],
          house['longitude'],
        );

        return _buildHouseListItem(house, context, distance);
      },
    );
  }

  // Create an individual house item widget
  InkWell _buildHouseListItem(
      Map<String, dynamic> house, BuildContext context, double distance) {
    return InkWell(
      onTap: () {
        _openHouseDetail(house);
      },
      child: Expanded(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          margin: const EdgeInsets.only(bottom: 20),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
              color: AppColors.white,
            ),
            child: Picture(house: house, distance: distance),
          ),
        ),
      ),
    );
  }
}
