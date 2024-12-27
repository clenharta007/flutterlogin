class Endpoints {
  static const String baseUrl = 'http://192.168.1.7:3000';

  // Authentication Endpoints
  static const String login = '$baseUrl/api/login';
  static const String register = '$baseUrl/api/register';
  static const String verify = '$baseUrl/api/verify-otp';

  // User Endpoints
  static const String userProfile = '$baseUrl/user/profile';
  static const String updateUser = '$baseUrl/user/update';

  // Other Endpoints
  static const String fetchData = '$baseUrl/data';
}