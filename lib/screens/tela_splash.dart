import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:fluttergit/controllers/controlador_git_holmes.dart';
import 'package:get_it/get_it.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({Key? key}) : super(key: key);

  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> with AfterLayoutMixin<TelaSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(100),
        child: Image.asset("assets/splash.png"),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    GetIt.I.get<ControladorGitHolmes>().loadBase(() {
      Navigator.pushReplacementNamed(context, '/telaHome');
    });
  }
}
