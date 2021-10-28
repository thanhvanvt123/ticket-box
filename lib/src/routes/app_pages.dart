
import 'package:get/get.dart';
import 'package:ticket_box/src/pages/home/bindings/home_binding.dart';
import 'package:ticket_box/src/pages/home/views/home_page.dart';
import 'package:ticket_box/src/pages/login_gmail/bindings/login_email_binding.dart';
import 'package:ticket_box/src/pages/login_gmail/views/login_email_page.dart';
import 'package:ticket_box/src/pages/login_phone/bindings/login_phone_binding.dart';
import 'package:ticket_box/src/pages/login_phone/views/login_phone_screen.dart';
import 'package:ticket_box/src/pages/login_phone/views/verify_phone_screen.dart';
import 'package:ticket_box/src/pages/profile/bindings/profile_binding.dart';
import 'package:ticket_box/src/pages/profile/views/profile_page.dart';
import 'package:ticket_box/src/pages/profile_detail/bindings/profile_detail_binding.dart';
import 'package:ticket_box/src/pages/profile_detail/views/profile_detail_page.dart';
import 'package:ticket_box/src/pages/update_infomation_signup/bindings/update_profile_binding.dart';
import 'package:ticket_box/src/pages/update_infomation_signup/views/update_profile_page.dart';
import 'package:ticket_box/src/routes/routes.dart';
import 'package:ticket_box/src/pages/booking/bindings/booking_binding.dart';
import 'package:ticket_box/src/pages/booking/views/booking_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginEmailPage(),
      binding: LoginEmailBinding(),
    ),
    
    GetPage(
      name: Routes.loginPhone,
      page: () => LoginPhonePage(),
      binding: LoginPhoneBinding(),
    ),
    GetPage(
      name: Routes.phoneVerify,
      page: () => VerifyPhoneScreen(),
      binding: LoginPhoneBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.profileDetail,
      page: () => ProfileDetailPage(),
      binding: ProfileDetailBinding(),
    ),
    GetPage(
      name: Routes.updateProfile,
      page: () => UpdateProfilePage(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(name: Routes.bookings, 
    page: () => BookingPage(),
    binding: BookingBinding(),)
  ];
}
