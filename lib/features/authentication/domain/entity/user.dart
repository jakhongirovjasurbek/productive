class AuthUserEntity {
  final String email;
  final String? avatar;

  const AuthUserEntity({required this.email, this.avatar});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserEntity &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          avatar == other.avatar;
  @override
  int get hashCode => email.hashCode ^ avatar.hashCode;
  @override
  String toString() {
    return 'AuthUserEntity{email: $email, avatar: $avatar}';
  }
  AuthUserEntity copyWith({
    String? email,
    String? password,
    String? avatar,
  }) {
    return AuthUserEntity(
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }
}
