import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:project_real_estate/design/themes.dart';
import 'package:project_real_estate/fetch/api.dart';
import 'package:project_real_estate/screens/splash.dart';

// Format the price to have thousands separators and two decimal places
String formatPrice(String price) {
  try {
    double priceAsDouble = double.parse(price);

    String formattedPrice =
        NumberFormat("#,##0", "en_US").format(priceAsDouble);
    return formattedPrice;
  } catch (e) {
    // If we can't process the price, return the data as it is instead of an error.
    return price;
  }
}

void main() async {
  await dotenv.load(fileName: ".env");

  // Fetch the list of houses from an API
  final houses = await fetchHouses();

  List<Map<String, dynamic>> houseList = [];

  for (var house in houses) {
    // Create a list of house data with required formatting
    houseList.add(
      {
        "id": house['id'].toString(),
        "image": 'https://intern.d-tt.nl/' + house['image'],
        "price": formatPrice(house['price'].toString()),
        "bedrooms": house['bedrooms'].toString(),
        "bathrooms": house['bathrooms'].toString(),
        "size": house['size'].toString(),
        "description": house['description'].toString(),
        "zip": house['zip'].toString(),
        "city": house['city'].toString(),
        "latitude": double.parse(
            house['latitude'].toString()), // Process latitude as a double
        "longitude": double.parse(
            house['longitude'].toString()), // Process longitude as a double
        "createdDate": house['createdDate'].toString(),
      },
    );
  }

  runApp(
    MaterialApp(
      theme: mainTheme,
      darkTheme: darkTheme,
      themeMode:
          ThemeMode.system, // Use system theme for light and dark theme support
      home: SplashScreen(
        houseList: houseList, // Pass the real houseList data
      ),
    ),
  );
}
