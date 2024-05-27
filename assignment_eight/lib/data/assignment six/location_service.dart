// ignore_for_file: use_build_context_synchronously

import 'package:assignment_eight/controller/assignment%20six/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  final MapController markerController = Get.find<MapController>();

  Future<void> getCurrentPosition(
      BuildContext context, GoogleMapController mapController) async {
    if (!await _handleLocationPermission(context)) return;

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _updateUserLocationMarker(position);
      _addGeofenceCircle(position);
      _animateToUserLocation(mapController, position);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> _handleLocationPermission(BuildContext context) async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      _showSnackBar(context,
          'Location services are disabled. Please enable the services.');
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showSnackBar(context, 'Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showSnackBar(context,
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }

    return true;
  }

  void _updateUserLocationMarker(Position position) {
    markerController.setUserLocationMarker(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
    );
  }

  void _addGeofenceCircle(Position position) {
    markerController.addCircle(
      Circle(
        circleId: const CircleId('geofence'),
        center: LatLng(position.latitude, position.longitude),
        radius: 200,
        strokeColor: Colors.blue,
        strokeWidth: 2,
        fillColor: Colors.blue.withOpacity(0.1),
      ),
    );
  }

  void _animateToUserLocation(
      GoogleMapController mapController, Position position) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
