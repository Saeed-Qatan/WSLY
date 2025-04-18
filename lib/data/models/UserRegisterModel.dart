class UserModel {
  final String username;
  final String phone;
  final String email;
  final String address;
  final String password;
  final String password_confirmation;

  UserModel({
    required this.username,
    required this.phone,
    required this.email,
    required this.address,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toJson() => {
        'name': username,
        'phone_number': phone,
        'email': email,
        'address': address,
        'password': password,
        'password_confirmation': password_confirmation,
      };
}
