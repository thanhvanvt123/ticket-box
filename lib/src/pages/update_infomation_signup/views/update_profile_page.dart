import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:ticket_box/src/pages/update_infomation_signup/controllers/update_profile_controller.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:ticket_box/src/utils/utils.dart';

class UpdateProfilePage extends GetView<UpdateProfileController> {
  final SharedStates sharedStates = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Update Information',
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Obx(() {
                      String filePath = controller.filePath.value;

                      return Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 4))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Utils.resolveFileImg(
                              filePath,
                              "assets/images/profile.png",
                            ),
                          ),
                        ),
                      );
                    }),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.grey,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                height: 48,
                margin: EdgeInsets.only(top: 60, right: 20, left: 20),
                child: TextField(
                  onChanged: (value) {
                    controller.setUserName(value);
                  },
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors.grey.withOpacity(0.6))),
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.black45),
                      prefixIcon: Icon(
                        Icons.person_pin_rounded,
                        color: Colors.grey,
                      )),
                  //controller: phoneController,
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              ),
               Container(
                  height: 48,
                  margin: EdgeInsets.only(top: 15, right: 20, left: 20),
                  child: TextFormField(
                    enabled: false,
                    initialValue: sharedStates.phoneLogin.value,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors.grey.withOpacity(0.6))),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      hintText: 'Your Phone',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  height: 48,
                  margin: EdgeInsets.only(top: 15, right: 20, left: 20),
                  child: TextField(
                    onChanged: (value) {
                      controller.setEmail(value);
                    },
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey.withOpacity(0.6))),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      hintText: 'Your Email',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                ),
              Container(
                margin: EdgeInsets.only(top: 35, right: 20, left: 20),
                height: 46,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffFF6F66)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.updateUser();
                  },
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
