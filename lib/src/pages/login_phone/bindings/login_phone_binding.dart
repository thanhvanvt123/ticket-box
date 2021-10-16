import 'package:get/get.dart';
import 'package:ticket_box/src/pages/login_phone/controllers/login_phone_controller.dart';

class LoginPhoneBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Login by phone controller
    Get.lazyPut<LoginPhoneController>(() => LoginPhoneController());
  }
}
