import 'package:get/get.dart';
import 'package:mentor_app/app/models/notifications/getnotificationsResponseModel.dart';
import 'package:mentor_app/app/repositories/notificationsRepo.dart';

class NotificationsController extends GetxController {
  NotificationsRepository notificationsRepository =NotificationsRepository();
  Future<GetNotificationResponseModel> getNotifications()async{
    return notificationsRepository.getNotifications();
  }
}
