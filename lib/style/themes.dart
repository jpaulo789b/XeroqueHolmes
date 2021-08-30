import 'package:flutter/material.dart';
import 'package:fluttergit/util/util.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesApp {
  static Color corCinzaGustavo = colorFromHex("#1a1a1a")!;

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      cardColor: const Color(0xff1C1C1E),
      canvasColor: const Color(0xff2E3133),
      dividerColor: const Color(0xff383B3E),
      shadowColor: Colors.transparent,
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white70, displayColor: Colors.white70),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color:  Color(0xff383B3E),
      ),
      bottomAppBarColor: corCinzaGustavo,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey[600]),
      dialogBackgroundColor: Colors.grey[900],
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      splashColor: Colors.black,
      primaryColor: Colors.redAccent,
      primarySwatch: Colors.grey,
      iconTheme: const IconThemeData(
        color: Color(0xffB4B7BB),
      ),
      appBarTheme: AppBarTheme(
          color: corCinzaGustavo,
          iconTheme: const IconThemeData(color: Colors.white),
          ));

  static ThemeData ligthTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: colorFromHex("#FAFAFA"),
      backgroundColor: const Color(0xffFAFAFA),
      cardColor: Colors.white,
      canvasColor: const Color(0xffF3F3F4),
      bottomAppBarColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      shadowColor: const Color(0xffE4E5E6),
      dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      dividerTheme: const DividerThemeData(color: Color(0xffDCDDDF), thickness: 1),
      dialogBackgroundColor: Colors.grey[200],
      splashColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Color(0xff51555A),
      ),
      primaryColor: Colors.redAccent,
      primarySwatch: Colors.grey,
      appBarTheme: AppBarTheme(
          color: Colors.grey[50],
          textTheme: TextTheme(
            headline6: GoogleFonts.nunitoSans(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.black),
            caption: GoogleFonts.nunitoSans(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: Colors.white),
          )));
}
