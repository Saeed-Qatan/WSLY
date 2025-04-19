class ProfileEdit {
  late String name;
  late String email;
  late String number;
  late String address;
  late String carPlate;
  late String password;

  ProfileEdit({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
    required this.carPlate,
    required this.password, required String car_Plate,
  });

  factory ProfileEdit.fromJson(Map<String, dynamic> json) {
    return ProfileEdit(
      name: json["name"],
      email: json["email"],
      number: json["phone_number"],
      address: json["address"],
      carPlate: json["carPlate"],
      password: json["password"], car_Plate: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': number,
      'address': address,
      'carPlate': carPlate,
      'password': password,
    };
  }
}
