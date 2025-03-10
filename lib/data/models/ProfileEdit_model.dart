class ProfileEdit {
  late final String name;
  late final String email;
  late final String number;
  late final String address;
  late final String car_Plate;
  late final String password;

  ProfileEdit({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
    required this.car_Plate,
    required this.password,
  });

  factory ProfileEdit.fromJson(Map<String, dynamic> json) {
    return ProfileEdit(
      name: json["name"],
      email: json["email"],
      number: json["number"],
      address: json["address"],
      car_Plate: json["car_Plate"],
      password: json["password"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'number': number,
      'address': address,
      'car_Plate': car_Plate,
      'password': password,
    };
  }
}
