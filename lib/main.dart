import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticket_box/src/common/app_init.dart';
import 'package:ticket_box/src/common/constants.dart';
import 'package:ticket_box/src/common/strings.dart';
import 'package:ticket_box/src/pages/home/views/home_page.dart';
import 'package:ticket_box/src/pages/login_gmail/views/login_email_page.dart';
import 'package:ticket_box/src/pages/login_phone/views/login_phone_screen.dart';
import 'package:ticket_box/src/pages/login_phone/views/verify_phone_screen.dart';
import 'package:ticket_box/src/pages/profile/views/profile_page.dart';
import 'package:ticket_box/src/pages/profile_detail/views/profile_detail_page.dart';
import 'package:ticket_box/src/pages/update_infomation_signup/views/update_profile_page.dart';
import 'package:ticket_box/src/routes/app_pages.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ticket_box/src/common/themes.dart';

void main() async {
  AppInit.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      builder: BotToastInit(),
<<<<<<< HEAD
      theme: ThemeData(
          fontFamily: Fonts.montserrat,
          primaryColor: Colors.white,
          secondaryHeaderColor: secondary_color,
          accentColor: accent_green,
          backgroundColor: dark_background,
          textTheme: TextTheme(
              button: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16),
              bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              subtitle1: TextStyle(fontSize: 14, color: secondary_color))),
      
=======
      color: accent_green,
      theme: ThemeData(
        
        scaffoldBackgroundColor: dark_background,
        primaryColor: Colors.white,
        secondaryHeaderColor: secondary_color,
        accentColor: accent_green,
        backgroundColor: dark_background,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
          button: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 16),
            bodyText1: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
            subtitle1: TextStyle(fontSize: 14, color: secondary_color),
            subtitle2: TextStyle(fontSize: 16, color: secondary_color),
            bodyText2: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300)
        )
    ),
>>>>>>> vanlt
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: AppPages.routes,
    );
  }
}
