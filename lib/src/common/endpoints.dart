import 'package:ticket_box/src/common/constants.dart';

class Endpoints {
<<<<<<< HEAD
  static const String apiVer = "http://52.139.194.125/api";
  static const String apiVer1 = "api/v1.0";
=======
  static const String apiVer = 'api'; 
  //static const String apiVer1 = "api/v1.0";
>>>>>>> vanlt
  static const todos = "todos";

  /// Account enpoint version /api/v1
  static const accounts = '$apiVer/UserInformations';

   /// Events enpoint version /api/v1
  static const events = '$apiVer/Events';

   /// GroupInformations enpoint version /api/v1
  static const groups = '$apiVer/GroupInformations';

  
   /// Bookings enpoint version /api/v1
  static const bookings = '$apiVer/Bookings';

     /// Tickets enpoint version /api/v1
  static const tickets = '$apiVer/Tickets';


  /// Login via firebase endpoint version /api/v1
  // static const loginFirebase = '$apiVer1/auth/login-firebase';

  /// Refresh token endpoint version /api/v1
  // static const refreshToken = '$apiVer1/auth/refresh-token';

  /// Event enpoint version /api/v1
  static const events = '$apiVer/events';


   /// Group(club) enpoint version /api/v1
  static const groups = '$apiVer/GroupInformations';


}
