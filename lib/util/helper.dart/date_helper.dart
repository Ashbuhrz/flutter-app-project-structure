import 'package:intl/intl.dart';

String? universalDateToString(DateTime? date) {
  final DateFormat formatter = DateFormat('dd MMM, yyyy');
  if(date == null){
    return null;
  }
  try {
    return formatter.format(date);
  } catch (e) {
    return null;
  }
}

String universalDateTimeToString(DateTime date) {
  final DateFormat formatter = DateFormat('hh:mm aa dd MMM yyyy');
  try {
    return formatter.format(date).replaceAll('AM', 'am').replaceAll('PM', 'pm');
  } catch (e) {
    return '';
  }
}

String serverDateToString(DateTime date) {
  if (date == null) {
    return '';
  }
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  try {
    return formatter.format(date);
  } catch (e) {
    return '';
  }
}

String timeAgo(DateTime date) {
  if (date is DateTime) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago';
    }
    if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago';
    }
    if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago';
    }
    if (diff.inDays > 0) {
      return '${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago';
    }
    if (diff.inHours > 0) {
      return '${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago';
    }
    if (diff.inMinutes > 0) {
      return '${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago';
    }
    return 'just now';
  }
  return '';
}
