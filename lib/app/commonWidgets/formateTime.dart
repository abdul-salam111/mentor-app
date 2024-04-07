import 'package:intl/intl.dart';

String formatTime(String time) {
  // Parse the time string into a DateTime object
  DateTime parsedTime = DateFormat('HH:mm:ss').parse(time);
  
  // Format the DateTime object into a string with AM/PM
  String formattedTime = DateFormat('h:mm a').format(parsedTime);
  
  return formattedTime;
}