import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wsly/core/helper/navigations/app_navigatios.dart';
import 'package:wsly/data/services/auth_service.dart';
import 'package:wsly/view/main-page.dart';

class LogoutViewModel extends ChangeNotifier {
  final AuthService _authService;

  LogoutViewModel(this._authService);

  Future<void> logout(BuildContext context) async {
    await _authService.logout();
    AppNavigation.pushReplacment(
      context,
      MainPage(),
    ); 
  }
}
