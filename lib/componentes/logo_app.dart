import 'package:flutter/material.dart';
import 'package:fluttergit/controllers/controlador_app.dart';
import 'package:get_it/get_it.dart';

class LogoApp extends StatelessWidget {
  final double? width, height;
  const LogoApp({Key? key, this.width, this.height = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo_${GetIt.I.get<ControladorApp>().isAppDark ? 'white' : 'black'}.png",
      height: height,
      width: width,
    );
  }
}
