enum AuthErrorCode {
  not_auth,
  not_server,
  not_typing,
}

class AuthException implements Exception {
  AuthException(this.error);
  final AuthErrorCode error;
}
