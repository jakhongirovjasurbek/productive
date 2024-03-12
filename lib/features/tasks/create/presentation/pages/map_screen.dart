import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/create/presentation/bloc/location/location_cubit.dart';
import 'package:productive/features/tasks/create/presentation/bloc/location/location_state.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapScreenCubit, MapScreenState>(
        builder: (context, state) {
          if (state is MapScreenLoadedState) {
            return MapWidget(currentPosition: state.currentPosition);
          } else if (state is MapScreenErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: context.colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  final Position currentPosition;

  const MapWidget({Key? key, required this.currentPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        mapObjects: [
          PlacemarkMapObject(
            mapId: const MapObjectId("placemark"),
            point: Point(
              latitude: currentPosition.latitude,
              longitude: currentPosition.longitude,
            ),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  context.icons.locationpng,
                ),
              ),
            ),
          ),
        ],
        nightModeEnabled: true,
        onMapCreated: (YandexMapController controller) {
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(
                  latitude: currentPosition.latitude,
                  longitude: currentPosition.longitude,
                ),
                zoom: 100,
              ),
            ),
          );
        },
      ),
    );
  }
}
