
import 'package:flutter/material.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:fluttergit/util/util.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';


class TextUtil{

static TextSpan display1({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styledisplay1().copyWith(fontWeight: weight));

static TextSpan display2({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styledisplay2().copyWith(fontWeight: weight));

static TextSpan display3({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styledisplay3().copyWith(fontWeight: weight));

static TextSpan display4({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styledisplay4().copyWith(fontWeight: weight));

static TextSpan header({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleheader().copyWith(fontWeight: weight));

static TextSpan headLine1({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleheadLine1().copyWith(fontWeight: weight));

static TextSpan headLine2({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleheadLine2().copyWith(fontWeight: weight));

static TextSpan headLine3({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleheadLine3().copyWith(fontWeight: weight));

static TextSpan body1({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? stylebody1().copyWith(fontWeight: weight));

static TextSpan body1Chart({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? stylebody1Chart().copyWith(fontWeight: weight));

static TextSpan body2({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? stylebody2().copyWith(fontWeight: weight));

static TextSpan overLine1({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleoverLine1().copyWith(fontWeight: weight));

static TextSpan overLine2({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleoverLine2().copyWith(fontWeight: weight));

static TextSpan overLine3({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleoverLine2().copyWith(fontWeight: weight));

static TextSpan button({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? stylebutton().copyWith(fontWeight: weight));

static TextSpan action({String? text,TextStyle? style, FontWeight? weight})=> TextSpan(text: text,style: style ?? styleaction().copyWith(fontWeight: weight));

static TextStyle stylebutton1() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight:  FontWeight.bold,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );


    static TextStyle styledisplay1() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 64,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styledisplay2() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styledisplay3() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styledisplay4() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 45,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleheader() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleheadLine1() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleheadLine2() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleheadLine3() => GoogleFonts.nunitoSans(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#51555A"):colorFromHex("#FFFFFF")
    );
    static TextStyle stylebody1() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );
    static TextStyle stylebody1Chart() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#FFFFFF"):colorFromHex("#FFFFFF")
    );

    static TextStyle stylebody2() => GoogleFonts.nunitoSans(
        fontSize: 14,
        fontWeight:  FontWeight.normal,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleoverLine1() => GoogleFonts.nunitoSans(
        fontSize: 12,
        fontWeight:  FontWeight.normal,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleoverLine2() => GoogleFonts.nunitoSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );
    static TextStyle styleoverLine3() => GoogleFonts.nunitoSans(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );
    static TextStyle stylebutton() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight:  FontWeight.bold,
        color: GetIt.I.get<ControladorApp>().themeMode == ThemeMode.light ? colorFromHex("#80858C"):colorFromHex("#FFFFFF")
    );
    
    static TextStyle styleaction() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: GetIt.I.get<ControladorApp>().defaultColor
    );

}
