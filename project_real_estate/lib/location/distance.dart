// Calculate the distance between two geographic coordinates in meters
import 'package:geolocator/geolocator.dart';

double calculateDistance(double startLatitude, double startLongitude,
    double endLatitude, double endLongitude) {
  // Use the Geolocator package to calculate the distance
  double distanceInMeters = Geolocator.distanceBetween(
      startLatitude, startLongitude, endLatitude, endLongitude);
  double distanceInKilometers = distanceInMeters / 100000.0;
  return distanceInKilometers;
}
