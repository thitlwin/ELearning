class UnKnowApiException implements Exception {
  int httpCode;

  UnKnowApiException(this.httpCode);
}

class ItemNotFoundException implements Exception {}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}
