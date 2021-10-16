import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticket_box/src/routes/routes.dart';

class ProfileController extends GetxController {

  Future<void> logOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      BotToast.showText(text: "Đăng xuất thành công");
      Get.toNamed(Routes.login);
    }
  }

