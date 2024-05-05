class UserRegisterModels {
  final String firstName;
  final String lastName;
  final int? gender;
  final String email;
  final String phoneNumber;
  final String password;

  const UserRegisterModels({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory UserRegisterModels.fromJson(Map<String, dynamic> json) {
    return UserRegisterModels(
      firstName: json['firstname'],
      lastName: json['lastname'],
      // gender: 0,
      gender: 0,
      email: json['email'],
      phoneNumber: json['hp'],
      password: '',
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'hp': phoneNumber,
        'firstname': firstName,
        'lastname': lastName,
        'grup': 'member',
        'jenis_kelamin': gender,
        'password': password,
        'strict_password': true,
      };

  UserRegisterModels copyWith({
    String? firstName,
    String? lastName,
    int? gender,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return UserRegisterModels(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
