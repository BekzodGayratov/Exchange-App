import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/view/screens/home/view/main_page.dart';

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;
  RouteGenerator._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigate(MainPage());
    }
    return null;
  }

  navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
