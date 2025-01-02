class AuthResponse {
  final String accessToken;
  final String refreshToken;
  AuthResponse({required this.accessToken, required this.refreshToken});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
