import 'package:flutter/material.dart';

class Util {
  final Map<String, String> monthNumber = {
    "01": "Januari",
    "02": "Februari",
    "03": "Maret",
    "04": "April",
    "05": "Mei",
    "06": "Juni",
    "07": "Juli",
    "08": "Agustus",
    "09": "September",
    "10": "Oktober",
    "11": "November",
    "12": "Desember",
  };

  Color hexToColor(String colorCode) {
    return new Color(int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
  }

  double fitScreenSize(double main, double unit) {
    return main * unit;
  }

  String convertToDateString(String startDate, String endDate) {
    String res = "";
    print(startDate);
    print(endDate);
    List<String> startDateSplitted = startDate.split("-");
    List<String> endDateSplitted = endDate.split("-");

    if (startDateSplitted[1] == endDateSplitted[1]) {
      res += "${startDateSplitted[2]}-${endDateSplitted[2]} ${monthNumber[startDateSplitted[1]]} ${startDateSplitted[0]}";
    } else {
      res += "${startDateSplitted[2]} ${monthNumber[startDateSplitted[1]]} - ${endDateSplitted[2]} ${monthNumber[endDateSplitted[1]]} ${startDateSplitted[0]}";
    }
    return res;
  }

  String convertDate({String reviewDate}){
    String newDate;
    reviewDate.substring(0,9);
    List split = reviewDate.substring(0,9).split("-");
    switch (split[1]) {
      case "01": split[1] = "Januari";
      break;
      case "02": split[1] = "Februari";
      break;
      case "03": split[1] = "Maret";
      break;
      case "04": split[1] = "April";
      break;
      case "05": split[1] = "Mei";
      break;
      case "06": split[1] = "Juni";
      break;
      case "07": split[1] = "Juli";
      break;
      case "08": split[1] = "Agustus";
      break;
      case "09": split[1] = "September";
      break;
      case "10": split[1] = "Oktober";
      break;
      case "11": split[1] = "November";
      break;
      case "12": split[1] = "Desember";
      break;
    }
    newDate = split[2]+" "+split[1]+" "+split[0];
    return newDate;
  }
}

