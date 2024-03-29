import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:productive/assets/icons.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../../core/widgets/w_button.dart';
import '../../../../tasks/presentation/bloc/task_bloc.dart';

Future<dynamic> addLocation(BuildContext context) async {
  GeoPoint currentPosition = await _determinePosition();
  GeoPoint updatedPosition = currentPosition; // Initialize updatedPosition with currentPosition
  YandexMapController? controller;
  return showModalBottomSheet(
    backgroundColor: context.colors.bottomSheetBgColor,
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height / 2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: (MediaQuery.of(context).size.width / 100) * 21.5,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.colors.white,
                  ),
                ),
              ],
            ),
            const Gap(24),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: Stack(
                children:[
                  YandexMap(
                  nightModeEnabled: true,
                  onMapCreated: (YandexMapController controller) {
                    controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(
                            latitude: currentPosition.latitude,
                            longitude: currentPosition.longitude,
                          ),
                          zoom: 15,
                        ),
                      ),
                    );
                  },
                  onCameraPositionChanged: (CameraPosition cameraPosition, CameraUpdateReason reason, bool animated) {
                    updatedPosition = GeoPoint( // Update updatedPosition with the new latitude and longitude
                      cameraPosition.target.latitude,
                      cameraPosition.target.longitude,
                    );
                  },
                ),
                  Center(child: Image.asset(context.icons.locationpng,height: 16,width: 16,)),
              ],
              ),
            ),
            const Gap(13.5),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: WButton(
                borderRadius: 8,
                height: 40,
                onTap: () {
                  context.read<TaskBloc>().add(
                    AddLocation(
                      latitute: updatedPosition.latitude,
                      lontitute: updatedPosition.longitude,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  context.localization.save,
                  style: context.style.fontSize16Weight500,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void updatePlacemark(PlacemarkMapObject placemarkMapObject) {
}

Future<GeoPoint> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.'); // Throw an exception if services are disabled
  }

  // Check location permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied'); // Throw an exception if permission is denied
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are permanently denied, we cannot request permissions.'); // Throw an exception if permission is permanently denied
  }

  // Get the current position
  Position position = await Geolocator.getCurrentPosition();

  // Create a GeoPoint object using the latitude and longitude of the Position
  GeoPoint geoPoint = GeoPoint(position.latitude, position.longitude);

  return geoPoint;
}
