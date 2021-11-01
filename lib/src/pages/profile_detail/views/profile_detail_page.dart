import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/pages/profile_detail/controllers/profile_detail_controller.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:ticket_box/src/utils/utils.dart';

class ProfileDetailPage extends GetView<ProfileDetailController> {
  final SharedStates sharedData = Get.find();
  // final user = FirebaseAuth.instance.currentUser!;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Account? user = sharedData.account;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: accent_green,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        elevation: 1,
        title: Column(
          children: [
            Text(
              'Update Infomation',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
            Get.back(closeOverlays: true);
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Obx(() {
                      String filePath = controller.filePath.value;
                      return Container(
                          width: 100,
                          height: 100,
                          // width: screenSize.width*0.3,
                          //   height: screenSize.height*0.2,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Utils.resolveFileImg(
                                  filePath,
                                  user!.avatarUrl.toString(),
                                ),
                              )));
                    }),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => controller.getImage(),
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
                              color: accent_green,
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
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) {
                      controller.changeName(value);
                    },
                    initialValue: user!.fullName.toString(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Name',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    enabled: false,
                    initialValue: user.email.toString(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Email',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) {
                      controller.changePhone(value);
                    },
                    initialValue: (user.phone.toString().endsWith('ull'))
                        ? ''
                        : user.phone.toString(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),
                        labelText: 'Phone',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenSize.width*0.4,
                    height: 50,                    
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white24),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width*0.4,
                    height: 50,                    
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: accent_green),
                      onPressed: () {
                        controller.updateProfile(user.userId!);
                      },
                      child: Text(
                        "Save",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
