import 'package:flutter/material.dart';
import 'package:wsly/core/constants/services/date_time_services.dart';

class DateTimeViewModel extends ChangeNotifier {
  String _CurrentDateTime = "";

  DateTimeViewModel() {
    updateDateTime();
  }
  String get CurrentDateTime => _CurrentDateTime;
  void updateDateTime() {
    _CurrentDateTime = DateTimeServices.getDateTime();
    notifyListeners();
  }
}
