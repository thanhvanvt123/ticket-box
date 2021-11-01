import 'package:get/get.dart';
import 'package:ticket_box/src/pages/notifications/controllers/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Home controller
    Get.lazyPut<NotificationsController>(() => NotificationsController());
  }
}