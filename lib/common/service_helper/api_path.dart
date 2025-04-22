class ApiPath {
  // Base URL
  static const String baseUrl = 'https://dev.techjockey.guru';

  // API Version
  static const String apiVersion = 'v1';

  // Full base API path
  static const String baseApiPath = '$baseUrl/api/$apiVersion';

  // Common endpoints
  static const String faqs = '$baseApiPath/common/faqs';
  static const String pBank = '$baseApiPath/common/banks';
}
