import 'package:fluttergit/util/string_extension.dart';
import 'package:intl/intl.dart';

class UtilDataHora {
  static num daysBetween({DateTime? inicio, num? inicioMilis, DateTime? fim, num? fimMilis}) {
    try {
      var dateA = inicio ?? DateTime.fromMillisecondsSinceEpoch(inicioMilis!.toInt());
      var dateB = fim ?? DateTime.fromMillisecondsSinceEpoch(fimMilis!.toInt());
      return dateA.difference(dateB).inDays;
    } catch (e) {
      return 0;
    }
  }

  static bool dataJaPassouDeHojeHora0({int? dataMilis, DateTime? dateTime}) {
    try {
      var dateA = dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      dateA = DateTime(dateA.year, dateA.month, dateA.day, 0, 0, 0, 0, 0);
      return DateTime.now().isBefore(dateA);
    } catch (e) {
      return false;
    }
  }

  static DateTime? getDataComHorasPersonalizada(
      {int? dataMilis, DateTime? dateTime, String? dataString, int horas = 0, int minutos = 0, int segundos = 0, int milesimos = 0, int micro = 0}) {
    try {
      var dateA = dateTime ?? parseStringToDate(dataString!) ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      dateA = DateTime(dateA.year, dateA.month, dateA.day, horas, minutos, segundos, milesimos, micro);
      return dateA;
    } catch (e) {
      return null;
    }
  }

  static bool dataMenorQueDeAgora({int? dataMilis, DateTime? dateTime, String? dataString}) {
    try {
      var dateA = dateTime ?? parseStringToDate(dataString!);
      dateA = DateTime(dateA!.year, dateA.month, dateA.day, 0, 0, 0, 0, 0);
      return dateA.isBefore(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  static bool dataEigualDaDeHoje({int? dataMilis, DateTime? dateTime, String? dataString}) {
    try {
      var dateA = dateTime ?? parseStringToDate(dataString!) ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      dateA = DateTime(dateA.year, dateA.month, dateA.day, 0, 0, 0, 0, 0);
      return getDaTaMesDiaAno(dateTime: DateTime.now()) == getDaTaMesDiaAno(dateTime: dateA);
    } catch (e) {
      return false;
    }
  }

  static bool horaDataEstaOcorrendoAgora({int? dataMilis, DateTime? dateTime}) {
    try {
      var dateA = dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      var dAgora = DateTime.now();
      var horaEstaOcorrendo = (dAgora.hour <= dateA.hour && dateA.hour <= dAgora.hour);
      // Hora é a mesma?
      if (dAgora.hour == dateA.hour) {
        return horaEstaOcorrendo && dAgora.minute < dateA.minute;
      } else {
        return horaEstaOcorrendo;
      }
    } catch (e) {
      return false;
    }
  }

  static bool dataPassouDeAgora({int? dataMilis, DateTime? dateTime}) {
    try {
      var dateA = dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      return DateTime.now().isAfter(dateA);
    } catch (e) {
      return false;
    }
  }

  static bool horaDataPassou({int? dataMilis, DateTime? dateTime}) {
    try {
      var dateA = dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      return DateTime.now().hour > dateA.hour;
    } catch (e) {
      return false;
    }
  }

  static bool dataJaPassouDeHoje({int? dataMilis, DateTime? dateTime}) {
    try {
      var dateA = dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!.toInt());
      return DateTime.now().isAfter(dateA);
    } catch (e) {
      return false;
    }
  }

  static num? getAnosAteHoje({int? dataMilis, DateTime? dateTime}) {
    if (dataMilis == null && dateTime == null) return null;
    return DateTime.now().year - (dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!)).year;
  }

  static DateTime? parseStringToDate(String date, {bool minutos = false}) {
    try {
      return DateTime.parse(date);
    } catch (e) {
      if (date.contains("-")) date = date.replaceAll("-", "");
      try {
        if (minutos) {
          return DateFormat('d/M/yyyy HH:mm').parse(date);
        } else {
          return DateFormat('d/M/yyyy').parse(date);
        }
      } catch (e) {
        return null;
      }
    }
  }

  static String getDaTaMesDiaAno({int? dataMilis, DateTime? dateTime,  String? locale}) {
    try {
      var formatter = DateFormat.yMd(locale);
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getMesLocalizado({int? dataMilis, DateTime? dateTime, String? dataString}) {
    try {
      if (dataString != null) dateTime = parseStringToDate(dataString);
      var formatter = DateFormat('MMM');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--/--/----";
    }
  }

  static int getWeek(DateTime date) {
    int year = date.year;
    DateTime stateDate = DateTime(year, 1, 1);
    int weekday = stateDate.weekday;
    int days = date.difference(stateDate).inDays;
    int week = ((weekday + days) / 7).ceil();
    return week;
  }

  static String getDiaDaSemanaLocalizado({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat('EEEE, dd/MM');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getDiaDaSemanaLocalizadoResumido({int? dataMilis, DateTime? dateTime, String? locale}) {
    try {
      var formatter = DateFormat('EE', locale);
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getDiaDaSemanaLocalizadoResumido2({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat('E');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getDaTaAnoMesDia({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getDia({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat.d();
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--";
    }
  }

  static String getDiaAbreviacao({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat.E('pt');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--";
    }
  }

//   static Timestamp getTimeStamp(DateTime? dateTime) {
//     return Timestamp.fromDateTime(dateTime);
//   }

//   static DateTime getDateFromTimeStamp(String dateTime) {
//     return Timestamp.parse(dateTime).toDateTime();
//   }

  static num getWeekOfMonth(DateTime? dateTime) {
    String date = dateTime.toString();
    String firstDay = date.substring(0, 7) + '01' + date.substring(10);
    int weekDay = DateTime.parse(firstDay).weekday;
    int currentWeek;
    if (weekDay == 7) {
      currentWeek = (DateTime.now().day / 7).ceil();
    } else {
      currentWeek = ((DateTime.now().day + weekDay) / 7).ceil();
    }
    return currentWeek;
  }

  static String getMes({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat.MMM();
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--";
    }
  }

  static String getDiaMes({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat.MMMd();
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--";
    }
  }

  static String getDiaMesAno({int? dataMilis, DateTime? dateTime, String? dateString}) {
    try {
      if (dateString != null) dateTime = parseStringToDate(dateString);
      var formatter = DateFormat.yMd('pt');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "00/00/00";
    }
  }

  static List<DateTime> getTodosDiasDaSemana({DateTime? time}) {
    final firstDayOfWeek = time!.subtract(Duration(days: time.weekday - 1));
    return List.generate(7, (index) => index).map((value) => firstDayOfWeek.add(Duration(days: value))).toList();
  }

  static getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  static num getSemanaMesAno(DateTime? dateTime) {
    return num.parse("${getWeek(dateTime!)}${getMesAno(dateTime: dateTime).replaceAll('/', '')}");
  }

  static String getSemanaMesAnoString(DateTime? dateTime) {
    return "${getMesAno(dateTime: dateTime)} - ${getWeekOfMonth(dateTime)}ª semana";
  }

  static String getMesAnoNome({int? dataMilis, DateTime? dateTime, String? dateString}) {
    try {
      if (dateString != null) dateTime = parseStringToDate(dateString);
      var formatter = DateFormat.MMMM();
      return capitalize(formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!)));
    } catch (e) {
      return "00/0000";
    }
  }

  static String getMesAno({int? dataMilis, DateTime? dateTime, String? dateString}) {
    try {
      if (dateString != null) dateTime = parseStringToDate(dateString);
      var formatter = DateFormat.yM('pt');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "00/0000";
    }
  }

  static String getDiaMesAnoHorasMinutos({int? dataMilis, DateTime? dateTime, String? dateString}) {
    try {
      if (dateString != null) dateTime = parseStringToDate(dateString, minutos: true);
      var formatter = DateFormat.yMd('pt').add_Hm();
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "00/00/00 00:00:00";
    }
  }

  static String getApenasHora({int? dataMilis, DateTime? dateTime}) {
    try {
      var formatter = DateFormat.Hm();
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis!));
    } catch (e) {
      return "--:--";
    }
  }

  static String getApenasMinSecs({Duration? duration, num? segundos}) {
    try {
      return format(duration ?? Duration(seconds: segundos!.toInt()));
    } catch (e) {
      return "--:--";
    }
  }

  static DateTime formatMMSS({Duration? duration, num? segundos}) {
    duration = duration ?? Duration(seconds: segundos!.toInt());
    var date = DateTime.now();
    date = date.subtract(Duration(hours: date.hour, minutes: date.minute, seconds: date.second, milliseconds: date.millisecond));
    date.add(duration);
    return date;
  }

  static bool isValidDate(String input) {
    try {
      final date = parseStringToDate(input);
      return input == getDiaMesAno(dateTime: date);
    } catch (e) {
      return false;
    }
  }

  static format(Duration d) => d.toString().split('.').first.replaceFirst("0:", "");
  static DateTime? parseNunToDate(num? value) => value != null ? DateTime.fromMillisecondsSinceEpoch(value.toInt()) : null;
  static num? parseDateToNum(DateTime? date) => date?.millisecondsSinceEpoch;
}
