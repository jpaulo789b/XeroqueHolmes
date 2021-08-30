// ignore: file_names
import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:charts_flutter/flutter.dart' as charts;

// charts.Color colorToChartFromHex(dynamic color) {
//   if (color is String) {
//     return charts.Color.fromHex(code: color);
//   } else {
//     return charts.Color.fromOther(color: color);
//   }
// }

Color? colorFromHex(String? hexString) {
  if (hexString == null) return null;
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String colorToHex(Color color) {
  String hexString = '#' + color.value.toRadixString(16);
  hexString = hexString.substring(2, hexString.length);
  return hexString;
}
