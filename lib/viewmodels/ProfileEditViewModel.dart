import 'package:flutter/material.dart';
import 'package:wsly/data/models/ProfileEdit_model.dart';

import 'package:wsly/data/services/ProfileEditService.dart';


class EditProfileViewModel extends ChangeNotifier {
  ProfileEdit _profile = ProfileEdit(
    name: '',
    email: '',
    number: '',
    address: '',
    carPlate: '',
    password: '', car_Plate: '', 
  );

  final EditProfileService _service = EditProfileService();

  ProfileEdit get profile => _profile;

  void setInitialData(ProfileEdit data) {
    _profile = data;
    notifyListeners();
  }

  void updateName(String value) {
    _profile.name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _profile.email = value;
    notifyListeners();
  }

  void updateNumber(String value) {
    _profile.number = value;
    notifyListeners();
  }

  void updateAddress(String value) {
    _profile.address = value;
    notifyListeners();
  }

  void updateCarPlate(String value) {
    _profile.carPlate = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _profile.password = value;
    notifyListeners();
  }

  Future<bool> submitProfile() async {
    return await _service.updateProfile(_profile);
  }
}
