import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';

class LoginEmailController extends GetxController {
  // Share states across app
  final SharedStates sharedStates = Get.find();

  GoogleSignIn? _googleSignIn;

  // Show password
  final isShowPass = true.obs;

  // Save change show password
  void changeIshowPass() {
    isShowPass.value = !isShowPass.value;
  }

  void loginWithGoogle() async {
    try {
      BotToast.showLoading();
      _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn!.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
      print('hello: '+ result.user.toString());
      if (result.user != null) {
        BotToast.showText(text: "Đăng nhập thành công");
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Đăng nhập thất bại");
    }
    BotToast.closeAllLoading();
  }

  void checkLoginWithPhoneAndPass(String phone, String pass) {
    try {
      BotToast.showLoading();
      if (phone.isNotEmpty && pass.isNotEmpty) {
        // lưu DB and User here

        BotToast.showText(
            text: "Đăng nhập thành công",
            textStyle: TextStyle(fontSize: 16),
            duration: const Duration(seconds: 5));
        Get.toNamed(Routes.home);
      } else {
        BotToast.showText(
            text: "Required Information!",
            textStyle: TextStyle(fontSize: 16),
            duration: const Duration(seconds: 7));
      }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Your phone or password wrong ! Login In Failed");
    }
    BotToast.closeAllLoading();
  }

  // Future<void> logOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   await _googleSignIn!.signOut();
  //   BotToast.showText(text: "Logout Successfully");
  //   Get.toNamed(Routes.login);
  // }
}
