import 'package:intl/intl.dart';

class TimeManager {
  static String rmTime(String dateTimeStr) {
    final inputFormat = DateFormat("dd MMM yyyy hh:mm a");
    DateTime dateTime = inputFormat.parse(dateTimeStr).toLocal();

    DateTime now = DateTime.now();

    if (dateTime.isBefore(now)) {
      return '';
    }

    Duration difference = dateTime.difference(now);

    if (difference.inHours < 2) {
      return _countdownString(difference);
    }

    String formattedDate = DateFormat("d MMM").format(dateTime);
    String formattedTime = DateFormat("h:mm a").format(dateTime);

    return "$formattedDate\n$formattedTime";
  }

  static String upMDT(String dateTimeStr) {
    final inputFormat = DateFormat("dd MMM yyyy hh:mm a");
    DateTime dateTime = inputFormat.parse(dateTimeStr).toLocal();

    DateTime now = DateTime.now();

    if (dateTime.isBefore(now)) {
      return '';
    }

    Duration difference = dateTime.difference(now);

    if (difference.inHours < 2) {
      return _countdownString(difference);
    }

    String formattedDate = DateFormat("d MMM").format(dateTime); // 22 Nov
    String formattedTime = DateFormat("h:mm a").format(dateTime); // 9:00 PM

    return "$formattedDate\n$formattedTime";
  }

  static String _countdownString(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;

    String hoursPart = hours > 0 ? '${hours}h : ' : '00h : ';
    String minutesPart = '${minutes.toString().padLeft(2, '0')}m';

    return '$hoursPart$minutesPart';
  }

  static String formatDay(String date) {
    DateFormat inputFormat = DateFormat("dd MMM yyyy");
    DateTime dateTime = inputFormat.parse(date);

    DateTime now = DateTime.now();
    bool isToday =
        dateTime.year == now.year &&
            dateTime.month == now.month &&
            dateTime.day == now.day;

    if (isToday) {
      return "Today";
    }

    return DateFormat('d MMMM, EEEE').format(dateTime);
  }

  static String setSortTime(String datetime) {
    DateTime dateTime = DateTime.parse(datetime);
    String formattedDate = DateFormat("dd MMM").format(dateTime);
    return formattedDate;
  }

  static String setNewsTime(String datetime) {
    DateTime dateTime = DateTime.parse(datetime);
    String formattedDate = DateFormat("dd MMMM yyyy").format(dateTime);
    return formattedDate;
  }

  static String convertUtcToLocal(String inputDate) {
    try {
      DateFormat inputFormat = DateFormat("M/d/yyyy'T'HH:mmZ");
      DateTime utcDateTime = inputFormat.parseUtc(inputDate);

      DateTime localDateTime = utcDateTime.toLocal();

      return DateFormat("d MMM hh:mm a").format(localDateTime);
    } catch (e) {
      return "";
    }
  }
}
