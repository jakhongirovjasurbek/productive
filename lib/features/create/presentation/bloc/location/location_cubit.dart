import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'location_state.dart';

class MapScreenCubit extends Cubit<MapScreenState> {
  MapScreenCubit() : super(MapScreenLoadingState());

  void getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(MapScreenLoadedState(position));
    } catch (e) {
      emit(MapScreenErrorState('Failed to get current location'));
    }
  }
}