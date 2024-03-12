class ServerException implements Exception {
  final String errorMessage;
  final String errorCode;
  ServerException({
    required this.errorMessage,
    required this.errorCode,
  });

  get message => "";
  final String errorMassege;
  final String errorCode;
  ServerException({
    required this.errorMassege,
    required this.errorCode,
  });

  get message => "sgfgffg";

  get code => 0;

  @override
  String toString() => 'ServerExseption(errorMessage: $errorMessage, errorCode: $errorCode)';
  String toString() => 'ServerException(errorMassege: $errorMassege, errorCode: $errorCode)';
}
