import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../../../../core/exception/exception.dart';
import '../../domain/entity/event_entity.dart';
import '../model/event_model.dart';

abstract class EventRemoteDataSource {
  Future<List<EventEntity>> getEvents();
  Future<bool> createEvent(EventModel EventModel);

  factory EventRemoteDataSource() => _EventRemoteDataSource();
}

class _EventRemoteDataSource implements EventRemoteDataSource{
  @override
  Future<List<EventEntity>> getEvents() async {
    final firebase = FirebaseFirestore.instance;
    final collection = await firebase.collection('event').get();
    final event = collection.docs.map((e) => EventModel.fromJson(e.data(),e.id)).toList();
    if (event.isNotEmpty) {
      return event.map((e) => e.toEventEntities).toList();
    }
    else {
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> createEvent(EventModel eventModel) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('event').add(
        eventModel.toJson(),
      );
      return true;
    } catch(e) {
      throw ServerException(
          errorMessage: "Cannot create event",
          errorCode: '777'
      );
    }
  }
}