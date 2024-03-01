import 'package:productive/core/exseption/exseption.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/calendar/data/models/model.dart';
import 'package:productive/features/calendar/domain/entities/entities.dart';
import 'package:productive/features/calendar/mock_data.dart';

abstract class CalendarDataSource {
  Future<List<CalendarEntities>> getData();

  factory CalendarDataSource() => _CalendarDataSource();
}

class _CalendarDataSource implements CalendarDataSource {
  @override
  Future<List<CalendarEntities>> getData() async {
    try {
      final result = await data['data'];
      final response = (result as List)
          .map(
            (e) => CalendarModel.fromJson(e),
          )
          .toList();
      return response.map((e) => e.toEntities).toList();
    } catch (e) {
      throw ServerException(
        errorMassege: "",
        errorCode: "666",
      );
    }
  }
}
