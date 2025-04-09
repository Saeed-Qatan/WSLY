
import 'package:intl/intl.dart';

class DateTimeServices {

  static String getDateTime() {
    Intl.defaultLocale = 'ar';
    DateTime now = DateTime.now(); 
    return DateFormat('EEEE, d MMM yyyy -hh:mm a', 'ar').format(now);
  }
}