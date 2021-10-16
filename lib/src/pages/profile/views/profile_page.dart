import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ticket_box/src/models/account.dart';
import 'package:ticket_box/src/pages/profile/controllers/profile_controller.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/services/global_states/shared_states.dart';
import 'package:ticket_box/src/widgets/custom_bottom_bar.dart';


class ProfilePage extends GetView<ProfileController> {
  final SharedStates sharedData = Get.find();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    final Account? userInfo = sharedData.account;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 10.0 * 5),
          Column(
            children: <Widget>[
              Container(
                height: 10.0 * 10,
                width: 10.0 * 10,
                margin: EdgeInsets.only(top: 10.0 * 3),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(radius: 10.0 * 5,
                        backgroundImage: (user.isNull)
                            ? NetworkImage('https://pngimg.com/uploads/mouth_smile/mouth_smile_PNG42.png')
                            : NetworkImage(user.photoURL!)),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.profileDetail);
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 10.0 * 2.5,
                          width: 10.0 * 2.5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            heightFactor: 10.0 * 1.5,
                            widthFactor: 10.0 * 1.5,
                            child: Icon(
                              FontAwesomeIcons.pencilAlt,
                              color: Colors.black,
                              size: 10.0 * 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text( (user.isNull)? 'Username loading' : user.displayName!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.profileDetail);
            },
            child: Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 25,
                    color: Color(0xff28BEBA),
                  ),
                  SizedBox(width: 15),
                  Text('My account',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 55,
              margin:
              EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.help, size: 25, color: Color(0xff28BEBA)),
                  SizedBox(width: 15),
                  Text('Help and support',
                      style: TextStyle(
                        fontSize: 10.0 * 1.7,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.policy, size: 25, color: Color(0xff28BEBA)),
                  SizedBox(width: 15),
                  Text('Terms & Policy',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.logOut();
              Get.toNamed(Routes.login);
            },
            child: Container(
              height: 55,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 20,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.logout, size: 25, color: Color(0xff28BEBA)),
                  SizedBox(width: 15),
                  Text('Logout',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottombar(),
    );
  }
}
