class LoginModel {
  final String emailOrPhone;
  final String password;

  LoginModel({
    required this.emailOrPhone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': emailOrPhone,
        'password': password,
      };
}
