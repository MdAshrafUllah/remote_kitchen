import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var userLocationMarker = Rxn<Marker>();
  var customMarker = Rxn<Marker>();
  var circles = <Circle>[].obs;

  void setUserLocationMarker(Marker marker) {
    userLocationMarker.value = marker;
  }

  void setCustomMarker(Marker marker) {
    customMarker.value = marker;
  }

  void addCircle(Circle circle) {
    circles.add(circle);
  }

  Set<Marker> get markers {
    final markers = <Marker>{};
    if (userLocationMarker.value != null) {
      markers.add(userLocationMarker.value!);
    }
    if (customMarker.value != null) {
      markers.add(customMarker.value!);
    }
    return markers;
  }

  Set<Circle> get circleSet => circles.toSet();
}
