import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/api/account_service.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileDetailController extends GetxController {
  IAccountService _service = Get.find();
  final SharedStates sharedData = Get.find();
  Account? userInfo;

  final profileName = "".obs;

  void changeName(String content) {
    profileName.value = content;
  }

  final profilePhone = "".obs;

  void changePhone(String content) {
    profilePhone.value = content;
  }

  ImagePicker _imagePicker = Get.find();
  final filePath = ''.obs;

  Future<void> getImage() async {
    filePath.value = '';
    final picked = await _imagePicker.getImage(source: ImageSource.gallery);
    filePath.value = picked?.path ?? '';
    uploadFile(File(picked!.path));
  }

  var urlImageUpload = "".obs;

  Future uploadFile(File file) async {
    if (file == null) return;
    final fileName = basename(file.path);
    try {
      UploadTask task = FirebaseStorage.instance.ref().child('uploads/$fileName').putFile(file);
      if (task == null) {
        return null;
      };
      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      urlImageUpload.value = urlDownload;
      print('Download-Link: $urlDownload');
    } on FirebaseException catch (e) {
      print('lỗi: ' + e.toString());
    }
  }

  void updateProfile(int accountId) async {
    DateTime applyDate = DateTime.now();
    try {
    BotToast.showLoading();
    userInfo = sharedData.account;
    if(profilePhone.value.isEmpty){
      if(userInfo!.phone == null) {
        profilePhone.value = userInfo!.phone!;
      }else{
        profilePhone.value = "";
      }
    }
    if(profileName.value.isEmpty){
      profileName.value = userInfo!.fullName!;
    }
    if(urlImageUpload.value.isEmpty){
      urlImageUpload.value = userInfo!.avatarUrl!;
    }
    bool updateS = false;
      updateS = await _service.updateProfile(accountId,
        {
          "userId": accountId.toString(),
          "roleId": '2',
          "email": userInfo!.email!,
          "fullname": profileName.value,
          "phone": profilePhone.value,
          "isDeleted": 'false',
          "avatarUrl": urlImageUpload.value,
          "createDate": userInfo!.createDate.toString(),
          "modifyDate": applyDate.toString(),
        },
      );

    if (updateS) {
      BotToast.showText(
          text: "Cập nhật thành công !",
          textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          duration: const Duration(seconds: 5));
      Get.toNamed(Routes.profile);
    }else{
      BotToast.showText(
          text: "Cập nhật thất bại !",
          textStyle: TextStyle( fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          duration: const Duration(seconds: 5));
    }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Cập nhật thất bại");
    }
    BotToast.closeAllLoading();
  }
}
