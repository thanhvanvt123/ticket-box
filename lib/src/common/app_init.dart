import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticket_box/src/data/api_helper.dart';
import 'package:ticket_box/src/services/api/account_service.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:ticket_box/src/widgets/custom_bottom_bar.dart';

class AppInit {
  static void init() {
    initMobileAppServices();
    initApiServices();
  }

  /// Init mobile app services
  static void initMobileAppServices() {
    // Get image from file system
    Get.lazyPut<ImagePicker>(() => ImagePicker(), fenix: true);
    // Shared states between widget
    Get.lazyPut<SharedStates>(() => SharedStates(), fenix: true);
    // Bottom bar
    Get.lazyPut<CustomBottombarController>(
      () => CustomBottombarController(), fenix: true,
    );
  }

  /// Init api services
  static void initApiServices() {
    // Use for calling api
    Get.lazyPut<IApiHelper>(() => ApiHelper(), fenix: true);
    // Calling api at account service
    Get.lazyPut<IAccountService>(() => AccountService(), fenix: true);
  }
}
