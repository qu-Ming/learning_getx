import 'dart:io';

import 'package:flutter/material.dart';

//scroll không bị nhảy màu
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Map<String, dynamic> getHeader({String id = ''}) {
  final Map<String, dynamic> header = <String, dynamic>{
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.acceptCharsetHeader: 'utf-8',
    'k': key,
    'dm': dm,
    // 'tk': getTokenApi(id: id),
    'ttl': DateTime.now().ticks.toString(),
  };
  return header;
}

const _epochTicks = 621356220000000000;

extension TicksOnDateTime on DateTime {
  int get ticks => microsecondsSinceEpoch * 10 + _epochTicks;
}

const String key = "WYnIZVbJD5wSL+Pp8pmR8xUNuGA=";
const String dm = "https://mydtu.duytan.edu.vn";

RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class Utils {
  static Future<bool> checkInternetConnections() async {
    bool isConnect = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty) {
        isConnect = true;
      }
    } on SocketException catch (_) {
      isConnect = false;
    }
    return isConnect;
  }
}

// Future<UserModel?> getUser() async {
//   final preferences = Preferences();
//   final UserModel? user = await preferences.getUserPreference();
//   return user;
// }

// Future<int> getPupilID() async {
//   final preferences = Preferences();
//   final int pupilID = await preferences.getIDpupil();
//   return pupilID;
// }
// Future<int> getIndexPupil() async {
//   final preferences = Preferences();
//   final int index = await preferences.getIndexPupil();
//   return index;
// }

// Future<String> getLoginTime() async {
//   final preferences = Preferences();
//   final String loginTime = await preferences.getLoginTime();
//   return loginTime;
// }

// Future<bool> getExpiration() async {
//   bool expiry = false;
//   final preferences = Preferences();

//   try {
//     final String time = await preferences.getLoginTime();
//     final DateTime loginDate =
//         DateTime.parse(time.substring(1, time.length - 1));
//     final DateTime now = DateTime.now();
//     final second = now.difference(loginDate).inSeconds;
//     if (second < 604800) {
//       expiry = true;
//     }
//   } catch (e) {
//     expiry = false;
//   }
//   return expiry;
// }

// List<String> formatDate(String date) {
//   DateTime tempDate = new DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date);
//   // print(tempDate);
//   var formatter = new DateFormat('dd/MM/yyyy');
//   String formattedTime = DateFormat('kk:mm:a').format(tempDate);
//   String formattedDate = formatter.format(tempDate);
//   // print(formattedTime);
//   // print(formattedDate);

//   return [formattedDate, formattedTime];
// }

bool isSameDate(DateTime date, DateTime other) {
  return date.year == other.year &&
      date.month == other.month &&
      date.day == other.day;
}

int dateBetweenDate(DateTime date, DateTime other) {
  var berlinWallFellDate = DateTime.utc(date.year, date.month, date.day);
  final difference = other.difference(berlinWallFellDate).inDays;
  return difference + 1;
}

String getFullName(
    String currentMiddleName, String currentFirstName, String currentLastName) {
  if (currentMiddleName.isEmpty) {
    return '${currentLastName.trim()} ${currentFirstName.trim()}';
  } else {
    return currentLastName.trim() +
        ' ' +
        currentMiddleName.trim() +
        ' ' +
        currentFirstName.trim();
  }
}

String displayDateTimeToString(DateTime? dt) {
  String? sHour = dt?.hour.toString();
  String? sMinute = dt?.minute.toString().padLeft(2, "0");
  String result = sHour! + ':' + sMinute!;
  return result;
}

int checkInt(dynamic value) {
  if (value == null) {
    return -1;
  }
  if (value is double) {
    return value.toInt();
  } else {
    return value ?? -1;
  }
}

String allWordsCapitilize(String str) {
  if (str.trim() == "") {
    return "";
  }
  return str.toLowerCase().split(' ').map((word) {
    String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
    return word[0].toUpperCase() + leftText;
  }).join(' ');
}

// String formatDateTime(String datetime) {
//   if (datetime == "") {
//     return " ";
//   } else {
//     DateTime parseDate =
//         new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
//     var inputDate = DateTime.parse(parseDate.toString());
//     var outputFormat = DateFormat('dd/MM/yyyy');
//     var outputDate = outputFormat.format(inputDate);
//     return outputDate;
//   }
// }

// String formatDay(String datetime) {
//   if (datetime == "") {
//     return "dd";
//   } else {
//     DateTime parseDate =
//         new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
//     var inputDate = DateTime.parse(parseDate.toString());
//     var outputFormat = DateFormat('dd');
//     var outputDate = outputFormat.format(inputDate);
//     return outputDate;
//   }
// }

// String formatMonth(String datetime) {
//   if (datetime == "") {
//     return "MM";
//   } else {
//     DateTime parseDate =
//         new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
//     var inputDate = DateTime.parse(parseDate.toString());
//     var outputFormat = DateFormat('MM');
//     var outputDate = outputFormat.format(inputDate);
//     return outputDate;
//   }
// }

// String formatYear(String datetime) {
//   if (datetime == "") {
//     return "yyyy";
//   } else {
//     DateTime parseDate =
//         new DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(datetime);
//     var inputDate = DateTime.parse(parseDate.toString());
//     var outputFormat = DateFormat('yyyy');
//     var outputDate = outputFormat.format(inputDate);
//     return outputDate;
//   }
// }

// TextStyle initTextStyle(
//     {Color? color = Colors.black,
//     String? fontFamily = font,
//     FontWeight? weight = FontWeight.w400,
//     double? size = 16}) {
//   return TextStyle(
//     color: color,
//     fontFamily: fontFamily,
//     fontWeight: weight,
//     fontSize: size,
//   );
// }
