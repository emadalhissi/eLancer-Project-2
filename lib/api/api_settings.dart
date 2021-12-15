class ApiSettings {
  static const String _baseUrl = 'https://smart-store.mr-dev.tech/';
  static const String _apiBaseUrl = _baseUrl + 'api/';

  static const String login = _apiBaseUrl + 'auth/login';
  static const String register = _apiBaseUrl + 'auth/register';
  static const String activate = _apiBaseUrl + 'auth/activate';
  static const String forget = _apiBaseUrl + 'auth/forget-password';
  static const String reset = _apiBaseUrl + 'auth/reset-password';
  static const String logout = _apiBaseUrl + 'auth/logout';

  static const String storeApiKey = '1e8c16b9-f6ef-4a80-907f-ada9e38d7fdc';

  static const String city = _apiBaseUrl + 'cities';

  static const String home = _apiBaseUrl + 'home';
  static const String products = _apiBaseUrl + 'products/{id}';
  static const String category = _apiBaseUrl + 'categories';
  static const String subCategory = _apiBaseUrl + 'categories';
  static const String faqs = _apiBaseUrl + 'faqs';
  static const String contact = _apiBaseUrl + 'contact-requests';
  static const String favorite = _apiBaseUrl + 'favorite-products';
}
