class Endpoints {
  static const String apiVer = "api";
  static const String apiVer1 = "api/v1.0";
  static const todos = "todos";

  /// Edge enpoint version /api/v1
  static const edges = '$apiVer1/edges';

  /// Account enpoint version /api/v1
  static const accounts = '$apiVer1/accounts';

  /// Login via firebase endpoint version /api/v1
  static const loginFirebase = '$apiVer1/auth/login-firebase';

  /// Refresh token endpoint version /api/v1
  static const refreshToken = '$apiVer1/auth/refresh-token';

}
