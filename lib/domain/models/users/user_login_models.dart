class UserLoginModels {
  final String email;
  final String password;

  const UserLoginModels({required this.email, required this.password});

  factory UserLoginModels.fromJson(Map<String, dynamic> json) {
    return UserLoginModels(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() => {'username': email, 'password': password};

  UserLoginModels copyWith({
    String? email,
    String? password,
  }) {
    return UserLoginModels(
        email: email ?? this.email, password: password ?? this.password);
  }
}
