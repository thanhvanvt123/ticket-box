import 'package:get/get.dart';
import 'package:ticket_box/src/models/account.dart';

class SharedStates extends GetxService {
  /// selected bottom bar index
  final bottomBarSelectedIndex = 0.obs;

  // User login in app
  Account? account;

}
