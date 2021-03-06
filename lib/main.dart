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
      theme: ThemeData(fontFamily: Fonts.montserrat),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: AppPages.routes,
    );

  }
}
