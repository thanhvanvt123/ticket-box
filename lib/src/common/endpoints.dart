import 'package:ticket_box/src/common/constants.dart';

class Endpoints {
  static const String apiVer = 'api'; 
  //static const String apiVer1 = "api/v1.0";
  static const todos = "todos";

  /// Account enpoint version /api/v1
  static const accounts = '$apiVer/UserInformations';

   /// Account enpoint version /api/v1
  static const events = '$apiVer/Events';

   /// Account enpoint version /api/v1
  static const groups = '$apiVer/GroupInformations';


  /// Login via firebase endpoint version /api/v1
  // static const loginFirebase = '$apiVer1/auth/login-firebase';

  /// Refresh token endpoint version /api/v1
  // static const refreshToken = '$apiVer1/auth/refresh-token';

}
