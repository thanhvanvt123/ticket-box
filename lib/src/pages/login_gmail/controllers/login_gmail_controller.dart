import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/api/account_service.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';

class LoginEmailController extends GetxController {
  // Share states across app
  final SharedStates sharedStates = Get.find();
  IAccountService _accountService = Get.find();
  // User login in app
  Account? account;

  GoogleSignIn? _googleSignIn;

  // Show password
  final isShowPass = true.obs;

  // Save change show password
  void changeIshowPass() {
    isShowPass.value = !isShowPass.value;
  }

  void loginWithGoogle() async {
    DateTime applyDate = DateTime.now();
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
      print('hello là dữ liệu ở firebase: '+ result.user.toString());
      var createResult = await _accountService.createAccount(
            {
              "roleId": '2',
              "email": result.user!.email!,
              "fullname": result.user!.displayName!,
              // "phone": (result.user!.phoneNumber!.isEmpty) ? 'null' : result.user!.phoneNumber! ,
              "phone": 'null',
              "isDeleted": 'false',
              "avatarUrl": result.user!.photoURL.toString(),
              "createDate": applyDate.toString(),
              "modifyDate": applyDate.toString(),
            });

      if(createResult != null){
        sharedStates.account = createResult;
        BotToast.showText(text: "Đăng nhập thành công");
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Đăng nhập thất bại");
    }
    BotToast.closeAllLoading();
  }
}
