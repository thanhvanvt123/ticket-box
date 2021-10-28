import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/common/themes.dart';
import 'package:ticket_box/src/pages/login_phone/controllers/login_phone_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneScreen extends GetView<LoginPhoneController> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: dark_background,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: float_element_color,
      //   title: Text(
      //     'Verify Phone',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   leading: IconButton(
      //     padding: EdgeInsets.only(left: 10),
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: float_element_color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              height: screenSize.height * 0.5,
            ),
            Positioned(
              child: AppBar(
                centerTitle: true,
                title: Text(
                  'Verify Phone',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.white70),
              ),
            ),
            //SizedBox(height: 10),
            Positioned(
                top: screenSize.height * 0.15,
                left: 15,
                right: 15,
                child: Container(
                    width: screenSize.width - 30,
                    child: Column(
                      children: [
                        Text(
                          'Verification code has sent to ${controller.phoneNumber.value}. Please enter the text verification code.',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 60,
                          margin: EdgeInsets.only(
                            top: 30,
                          ),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              activeColor: Colors.black26,
                              borderWidth: 1,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: Colors.white30,
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: dark_green_50percent,
                              inactiveColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              controller.verifyCodeFromPhone(v);
                            },
                            onChanged: (value) {
                              // print(value);
                            },
                          ),
                        ),
                        Container(
                            width: screenSize.width * 0.7,
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Did't receive the Code ?",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.sendCodeToPhone(
                                        controller.phoneNumber.value);
                                    BotToast.showText(
                                        text:
                                            "Verifition Code Resend Successfull",
                                        duration: const Duration(seconds: 5));
                                  },
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                        fontSize: 16, color: accent_green),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ))),
          ],
        ),
      ),
    );
    // body: Container(
    //   child: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: SingleChildScrollView(
    //         child: Column(
    //       children: <Widget>[
    //         Container(
    //           width: MediaQuery.of(context).size.width * 0.8,
    //           height: 60,
    //           margin: EdgeInsets.only(
    //             top: 30,
    //           ),
    //           child: PinCodeTextField(
    //             appContext: context,
    //             length: 6,
    //             blinkWhenObscuring: true,
    //             animationType: AnimationType.fade,
    //             pinTheme: PinTheme(
    //               shape: PinCodeFieldShape.box,
    //               borderRadius: BorderRadius.circular(5),
    //               activeColor: Colors.black26,
    //               borderWidth: 1,
    //               selectedFillColor: Colors.white,
    //               inactiveFillColor: Colors.white,
    //               fieldHeight: 50,
    //               fieldWidth: 40,
    //               activeFillColor: Colors.blue[50],
    //               inactiveColor: Colors.white,
    //             ),
    //             cursorColor: Colors.black,
    //             animationDuration: Duration(milliseconds: 300),
    //             enableActiveFill: true,
    //             keyboardType: TextInputType.number,
    //             boxShadows: [
    //               BoxShadow(
    //                 offset: Offset(0, 1),
    //                 color: Colors.black12,
    //                 blurRadius: 10,
    //               )
    //             ],
    //             onCompleted: (v) {
    //               controller.verifyCodeFromPhone(v);
    //             },
    //             onChanged: (value) {
    //               // print(value);
    //             },
    //           ),
    //         ),
    //         Container(
    //             width: screenSize.width * 0.7,
    //             margin: EdgeInsets.only(top: 20),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Text(
    //                   "Did't receive the Code ?",
    //                   style: TextStyle(fontSize: 16, color: Colors.black),
    //                 ),
    //                 GestureDetector(
    //                   onTap: () {
    //                     controller
    //                         .sendCodeToPhone(controller.phoneNumber.value);
    //                     BotToast.showText(
    //                         text: "Verifition Code Resend Successfull",
    //                         duration: const Duration(seconds: 5));
    //                   },
    //                   child: Text(
    //                     'Resend',
    //                     style: TextStyle(fontSize: 18, color: Colors.blue),
    //                   ),
    //                 ),
    //               ],
    //             )),
    //       ],
    //     )),
    //   ),
    //));
  }
}
