class UserModel {
  final String username;
  final String phone;
  final String email;
  final String address;
  final String password;

  UserModel({
    required this.username,
    required this.phone,
    required this.email,
    required this.address,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'phone': phone,
        'email': email,
        'address': address,
        'password': password,
      };
}
