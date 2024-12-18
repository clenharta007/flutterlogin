class Endpoints {
  static const String baseUrl = 'https://example.com/api';

  // Authentication Endpoints
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';

  // User Endpoints
  static const String userProfile = '$baseUrl/user/profile';
  static const String updateUser = '$baseUrl/user/update';

  // Other Endpoints
  static const String fetchData = '$baseUrl/data';
}