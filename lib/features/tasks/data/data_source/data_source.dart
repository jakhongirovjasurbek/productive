import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/data/models/moke_model.dart';
import 'package:productive/features/tasks/domain/entities/notification_entities.dart';
import 'package:productive/features/tasks/mock_data.dart';

import '../../../../core/exseption/exseption.dart';

abstract class NotificationDataSource{
  Future <List<NotificationEntities>> getData();

  factory NotificationDataSource()=>_NotificationDataSource();
}

class _NotificationDataSource implements NotificationDataSource{
  @override
  Future<List<NotificationEntities>> getData() async{
   try{
     final result = await dataNotifications['data'];
     final response = (result as List).map((e) => MockDataNotificationsModel.fromJson(e)).toList();
     return response.map((e) => e.toEntitiesNotification).toList();
   }
   catch(e){
     throw ServerException(
       errorMassege: "",
       errorCode: "666",
     );
   }
  }

}