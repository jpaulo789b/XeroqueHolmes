import 'package:flutter/material.dart';

class NavigatorController {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context {
    return navigatorKey.currentState!.context;
  }

  Brightness get brightnessApp{
    return Brightness.light;
  }
  

  void goBack({String? routeName}) {
    if(routeName != null){
      return Navigator.popUntil(context, ModalRoute.withName(routeName));
    }else {
      return navigatorKey.currentState!.pop();
    }
  }
}
