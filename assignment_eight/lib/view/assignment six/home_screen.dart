import 'package:assignment_eight/controller/assignment%20six/map_controller.dart';
import 'package:assignment_eight/data/assignment%20six/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class AssignmentSixHomeScreen extends StatefulWidget {
  const AssignmentSixHomeScreen({super.key});

  @override
  State<AssignmentSixHomeScreen> createState() =>
      _AssignmentSixHomeScreenState();
}

class _AssignmentSixHomeScreenState extends State<AssignmentSixHomeScreen> {
  final MapController markerController = Get.put(MapController());
  final LocationService locationService = LocationService();
  late GoogleMapController mapController;
  bool locationOn = false;

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(22.359135, 91.821535),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Six"),
      ),
      body: Obx(() {
        return GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          markers: markerController.markers,
          circles: markerController.circleSet,
          onTap: (LatLng latLng) {
            markerController.setCustomMarker(
              Marker(
                markerId: MarkerId(latLng.toString()),
                position: latLng,
                infoWindow: InfoWindow(
                    title:
                        '${latLng.latitude.toStringAsFixed(2)}, ${latLng.longitude.toStringAsFixed(2)}'),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            locationOn = !locationOn;
            if (locationOn) {
              locationService.getCurrentPosition(context, mapController);
            }
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: Icon(
          locationOn
              ? Icons.my_location_rounded
              : Icons.location_disabled_rounded,
          color: Colors.blue,
        ),
      ),
    );
  }
}
