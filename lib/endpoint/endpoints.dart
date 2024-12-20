class Endpoints {
  static const String baseUrl = 'http://192.168.1.4:8000';

  // Authentication Endpoints
  static const String login = '$baseUrl/api/login';
  static const String register = '$baseUrl/api/register';

  // User Endpoints
  static const String userProfile = '$baseUrl/user/profile';
  static const String updateUser = '$baseUrl/user/update';

  // Other Endpoints
  static const String fetchData = '$baseUrl/data';
}