import 'package:geolocator/geolocator.dart';

abstract class MapScreenState {}

class MapScreenLoadingState extends MapScreenState {}

class MapScreenLoadedState extends MapScreenState {
  final Position currentPosition;

  MapScreenLoadedState(this.currentPosition);
}

class MapScreenErrorState extends MapScreenState {
  final String errorMessage;

  MapScreenErrorState(this.errorMessage);
}