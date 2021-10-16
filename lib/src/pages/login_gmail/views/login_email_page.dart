import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/pages/login_gmail/controllers/login_gmail_controller.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';

class LoginEmailPage extends GetView<LoginEmailController> {
  final SharedStates sharedStates = Get.find();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Image(
              width: screenSize.width,
              height: screenSize.height,
              fit: BoxFit.cover,
              image:
              AssetImage('assets/images/login-background.jpg')),

          Container(
            margin: EdgeInsets.only(top: 310),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 200),
                  GestureDetector(
                    onTap: () {
                      controller.loginWithGoogle();
                    },
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.google,
                              size: 10.0 * 2.5,
                              color: Colors.red.withOpacity(0.6),
                            ),
                            SizedBox(width: 30),
                            Text(
                              'Đăng nhập với Google',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.loginPhone);
                    },
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.phone,
                              size: 10.0 * 2.5,
                              color: Colors.lightBlue.withOpacity(0.6),
                            ),
                            SizedBox(width: 30),
                            Text(
                              'Đăng nhập với số điện thoại',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
