import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:triwarna_rebuild/app/components/base_text.dart';
import 'package:triwarna_rebuild/app/core/values/colors.dart';
import 'package:triwarna_rebuild/app/modules/dashboard/controller.dart';

class BackdropMaps extends StatelessWidget {
  BackdropMaps({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller.store.isEmpty
            ? const Center(child: BaseText(text: 'Store Data Not Found'))
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    controller.selectedLat.value ??
                        double.parse(controller.store.first.lat ?? ''),
                    controller.selectedLat.value ??
                        double.parse(controller.store.first.long ?? ''),
                  ),
                  zoom: 13,
                ),
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                ].toSet(),
                onMapCreated: (mapController) {
                  if (!controller.googleMapController.value.isCompleted) {
                    controller.googleMapController.value
                        .complete(mapController);
                  } else {}
                },
                markers: controller.markers,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                buildingsEnabled: true,
                indoorViewEnabled: true,
                mapToolbarEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
              ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.only(bottom: 40, right: 10),
            child: FloatingActionButton(
              backgroundColor: softPurpleColor,
              elevation: 1,
              onPressed: () {
                controller.myLocation();
              },
              child: const Icon(Icons.my_location),
            ),
          ),
        )
      ],
    );
  }
}
