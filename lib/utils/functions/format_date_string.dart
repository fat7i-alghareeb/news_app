import 'package:intl/intl.dart';

String formatDateString(String dateString) {
  DateTime date = DateTime.parse(dateString);

  String formattedDate = DateFormat('MMM d, yyyy HH:mm').format(date);

  return formattedDate;
}
