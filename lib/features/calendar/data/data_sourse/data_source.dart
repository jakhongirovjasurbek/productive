import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/exception/exception.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/calendar/data/models/model.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';

abstract class CalendarDataSource {
  Future<List<CalendarEntities>> getData();

  factory CalendarDataSource() => _CalendarDataSource();
}

class _CalendarDataSource implements CalendarDataSource {
  @override
  Future<List<CalendarEntities>> getData() async {
    final result = await FirebaseFirestore.instance.collection("tasks").get();
    final a = result.docs;

    print("object");
    final response = a
        .map(
          (e) => CalendarModel.fromJson(
            e.data(),
          ),
        )
        .toList();
        print(response);
    final data = response.map((e) => e.toEntities).toList();
    if (data.isNotEmpty) {
      return data;
    } else {
      throw ServerException(
        errorMessage: "errorMessage",
        errorCode: "errorCode",
      );
    }
  }
}
