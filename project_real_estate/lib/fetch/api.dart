import 'dart:convert';

import 'package:http/http.dart' as http;

// Define the API URL and access key
const String apiUrl = "https://intern.d-tt.nl/api/house";
const String accessKey = "98bww4ezuzfePCYFxJEWyszbUXc7dxRx";

// Function to fetch a list of houses from the API
Future<List<dynamic>> fetchHouses() async {
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {"Access-Key": accessKey},
  );

  if (response.statusCode == 200) {
    // Data was successfully retrieved from the API
    final data = json.decode(response.body);
    // Return the data
    return data;
  } else {
    // Unable to retrieve data from the API, handle the error message
    throw Exception(
        "Failed to fetch data from the API. Error code: ${response.statusCode}");
  }
}
