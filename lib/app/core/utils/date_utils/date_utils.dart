import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

///
/// Created by Sunil Kumar from Boiler plate
///

class AppDateUtils {
  static const String DATE_FORMAT_DD_MM_YY = "dd/MM/yy";
  static const String SINGLE_SPACE = ' ';
  static const AT = "at";
  static const DASH = "-";

  static DateTime initialStartingDate = DateTime(1900, 01);
  static DateTime initialEndingDate = DateTime.now();

  static String getCurrentWeekDay(String date) =>
      DateFormat(DateFormat.ABBR_WEEKDAY, "en").format(DateTime.parse(date));

  static String getMonthDay(String date) =>
      DateFormat(DateFormat.DAY, "en").format(DateTime.parse(date));

  static String getYearNumber(String date) =>
      DateFormat(DateFormat.YEAR, "en").format(DateTime.parse(date));

  static String getMonthNumber(String date) =>
      DateFormat(DateFormat.NUM_MONTH, "en").format(DateTime.parse(date));

  static String getHour(String date) =>
      DateFormat(DateFormat.HOUR24, "en").format(DateTime.parse(date));

  static String getMinutes(String date) =>
      DateFormat(DateFormat.MINUTE, "en").format(DateTime.parse(date));

  static String getMonth(String date) =>
      DateFormat(DateFormat.ABBR_MONTH, "en").format(DateTime.parse(date));

  static String getFullDate(String date) =>
      DateFormat("EEE, dd MMMM yyyy").format(DateTime.parse(date));

  static String getTime(String date) =>
      DateFormat("hh:mm aa").format(DateTime.parse(date));

  static String getHrAndMin(String date) =>
      DateFormat("HH:mm").format(DateTime.parse(date));

  static String getPreviousDateForMessages() =>
      DateFormat("yyyy-MM-dd").format(DateTime.parse(
          DateTime.now().subtract(const Duration(days: 365)).toString()));

  static String getDay(String date) =>
      DateFormat('dd').format(DateTime.parse(date));

  static String getDateWithFullMonth(DateTime date) =>
      DateFormat("dd MMM yyyy").format(date);

  static String getDateFromPicker(DateTime date) =>
      DateFormat("dd/MM/yyyy").format(date);

  static String getMonthForAttendance(DateTime date) =>
      DateFormat("mm").format(date);

  static String getYearForAttendance(DateTime date) =>
      DateFormat("yyyy").format(date);

  static String getApiFormatToDisplayDMYY(DateTime date) =>
      DateFormat('d/M/yy').format(date);

  static String getTimeFromAPIDate(DateTime date) =>
      DateFormat("hh:mm aa").format(date);

  static String getApiFormatToDisplayDateAndTime(DateTime date) =>
      DateFormat('dd/MM/yyyy hh:mm').format(date);

  static String getApiFormatToDisplayMMYY(DateTime date) =>
      DateFormat('MM/yy').format(date);

  static String getApiFormatToDisplayDDMMYYYY(DateTime date) =>
      DateFormat('dd/mm/yyyy').format(date);

  static String getApiFormatToDisplayMMDDYYYY(DateTime date) =>
      DateFormat('mm/dd/yyyy').format(date);

  static String getApiFormatToDisplayDD_MM_YYYY(DateTime date) =>
      DateFormat('dd.MM.yyyy').format(date);

  static String getDisplyDate(String date) =>
      DateFormat("dd.MM.yyyy").format(DateTime.parse(date));

  static DateTime setDateToPicker(String date) =>
      DateFormat("dd/MM/yyyy").parse(date);

  static String convertDateForApiRequest(DateTime date) =>
      DateFormat("yyyy-MM-dd").format(date);

  static DateTime getStringDateToDateTimeFormat(DateTime date) =>
      DateFormat(DATE_FORMAT_DD_MM_YY).parse(DateFormat('d/M/yy').format(date));

  static DateTime getStringDateAndDateTimeFormat(String date) =>
      DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(date);

  static String getStringDateAndTimeFormat(String date) => DateFormat('HH:mm')
      .format(DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(date));

  static String getDisplayDateInDMYY(DateTime date) =>
      DateFormat("d/M/yy").format(date);

  static String getDisplayDateInDDMMYYYY(DateTime date) =>
      DateFormat("dd.MM.yyyy").format(date);

  static String getDisplayDateInDDMMMYYYY(DateTime date) =>
      DateFormat("dd MMM yyyy").format(date);

  static String getSendAPIDate(DateTime date) =>
      DateFormat("dd/MM/yyyy").format(date);

  static String getCustomDate(DateTime date) =>
      DateFormat("dd MMM").format(date);

  static String getApiStringToDisplayDMYY(String date) =>
      DateFormat('d/M/yy').format(DateFormat('dd/MM/yy').parse(date));

  static String getDisplayDateInMMDDYYYY(DateTime date) =>
      DateFormat('mm/dd/yyyy').format(date);

  static String getTimeAndDate(String date) =>
      DateFormat("hh:mm aa dd.MM.yyyy").format(DateTime.parse(date));

  static String getDayName(DateTime date) => DateFormat('EEE').format(date);
  static String getMonthAndYear(DateTime date) =>
      DateFormat('MMMM yyyy').format(date);

  static String getTimeToApiTime(DateTime dateTime) {
    var duration = dateTime.timeZoneOffset;
    if (duration.isNegative)
      return (DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(dateTime) +
          "-${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    else
      return (DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(dateTime) +
          "+${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  }

  static String getCustomDateAndTime(DateTime startDate, DateTime endDate,
      DateTime fromDateTimeValue, DateTime toDateTimeValue) {
    String customFromDate = getCustomDate(startDate);
    String customToDate = getCustomDate(endDate);
    String customFromTime = getHrAndMin(fromDateTimeValue.toString());
    String customToTime = getHrAndMin(toDateTimeValue.toString());

    return (customFromDate +
        SINGLE_SPACE +
        AT +
        SINGLE_SPACE +
        customFromTime +
        SINGLE_SPACE +
        DASH +
        SINGLE_SPACE +
        customToDate +
        SINGLE_SPACE +
        AT +
        SINGLE_SPACE +
        customToTime);
  }

  static bool dateIsExpired(int year, int month) {
    return hasYearExpired(year) || hasMonthExpired(year, month);
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasMonthExpired(int year, int month) {
    var now = DateTime.now();
    return hasYearExpired(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month);
  }

  static bool hasYearExpired(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();

    return fourDigitsYear < now.year;
  }

  static String formatTimeAgo(DateTime? dateTime) {
    if (dateTime == null) return "";
    return timeago.format(dateTime);
  }

  /// Get duration in mm:ss
  String getDurationInMinutesAndSeconds(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
