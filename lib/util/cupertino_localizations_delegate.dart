import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


class _CupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'pt';

  @override
  Future<CupertinoLocalizations> load(Locale locale) => BrasilCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_CupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(de_DE)';
}

/// US English strings for the cupertino widgets.
class BrasilCupertinoLocalizations implements CupertinoLocalizations {
  /// Constructs an object that defines the cupertino widgets' localized strings
  /// for US English (only).
  ///
  /// [LocalizationsDelegate] implementations typically call the static [load]
  /// function, rather than constructing this class directly.
  const BrasilCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sab',
    'Dom',
  ];

  static const List<String> _shortMonths = <String>[
    'Jan',
    'Fev',
    'Mär',
    'Abpr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez',
  ];

  static const List<String> _months = <String>[
    "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro"
  ];



  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour.toString() + " Hr";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1)
      return '1 Minuto';
    return minute.toString() + ' Minito';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel => 'Info';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'Hora' : 'Horas';

  @override
  String timerPickerMinuteLabel(int minute) => 'Min';

  @override
  String timerPickerSecondLabel(int second) => 'Seg';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(const BrasilCupertinoLocalizations());
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _CupertinoLocalizationsDelegate();

  @override
  String get copyButtonLabel => "Copiar";

  @override
  String get cutButtonLabel => "Cortar";

  @override
  String get pasteButtonLabel => "Colar";

  @override
  String get selectAllButtonLabel => "Selecionar Tudo";

  @override
  String get todayLabel => "Hoje";

  String get modalBarrierDismissLabel => "";

  @override
  String get searchTextFieldPlaceholderLabel => "Pesquisar";

  @override
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  List<String> get timerPickerSecondLabels => throw UnimplementedError();

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    throw UnimplementedError();
  }

}