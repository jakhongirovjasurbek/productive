import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/tasks/data/models/moke_model.dart';
import 'package:productive/features/tasks/domain/entities/notification_entities.dart';

import '../../../../core/exception/exception.dart';


abstract class NotificationDataSource{
  Future <List<NotificationEntities>> getData();

  factory NotificationDataSource()=>_NotificationDataSource();
}

class _NotificationDataSource implements NotificationDataSource{
  @override
  Future<List<NotificationEntities>> getData() async{
   try{
     final result = await FirebaseFirestore.instance.collection("notifications").get();
     final result2 = result.docs;
     final result3=[];
     for(int i=0;i<result2.length;i++){
       result3.add(result2[i].data());
     }
     print(result3);
     final response = (result3).map((e) => MockDataNotificationsModel.fromJson(e)).toList();
     return response.map((e) => e.toEntitiesNotification).toList();
   }
   catch(e){
     print(e);
     throw ServerException(
       errorMessage: "",
       errorCode: "666",
     );
   }
  }

}