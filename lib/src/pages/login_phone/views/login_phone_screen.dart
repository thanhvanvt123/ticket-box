import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/pages/login_gmail/controllers/login_gmail_controller.dart';
import 'package:ticket_box/src/pages/login_phone/controllers/login_phone_controller.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ticket_box/src/widgets/custom_icon.dart';

class LoginPhonePage extends GetView<LoginPhoneController> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: dark_background,

        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: float_element_color,
        //   title: Text(
        //     'Sign Up',
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   leading: IconButton(
        //     padding: EdgeInsets.only(left: 10),
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),

        body: Container(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: screenSize.height * 0.2,
              ),
              createCustomIcon(Icons.person),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign up',
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Enter mobile number to receive a verification code for free.',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  cursorColor: secondary_color,
                  decoration: InputDecoration(
                    hintText: 'Enter Mobile Number',
                    hintStyle: TextStyle(color: secondary_color),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff286053)),
                      onPressed: () {
                        controller.sendCodeToPhone(phoneController.text);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: accent_green,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: screenSize.width -
                        (58 +
                            30 * 2 +
                            10), //padding = 30, back_button = 58, space = 10
                    height: 58,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: accent_green),
                      onPressed: () {
                        controller.sendCodeToPhone(phoneController.text);
                      },
                      child: Text(
                        "Send Verification Code",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                  child: Text(
                'You can also login with these methods',
                style: Theme.of(context).textTheme.subtitle1,
              )),
              SizedBox(height: 20),
              Center(
                child: SignInButton(
                  Buttons.GoogleDark,
                  text: "Sign up with Google",
                  onPressed: () {
                    LoginEmailController loginController = Get.find();
                    loginController.loginWithGoogle();
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                margin: const EdgeInsets.only(left: 15, bottom: 15),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'You agree ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextSpan(
                      text: 'User Agreement ',
                      style: TextStyle(
                          fontSize: 14, color: Colors.blue.withOpacity(0.8)),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                          fontSize: 14, color: Colors.blue.withOpacity(0.8)),
                    ),
                  ]),
                ),
              ),
            ],
          )),
        ));
  }
}
