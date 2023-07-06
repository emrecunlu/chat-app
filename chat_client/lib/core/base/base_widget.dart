import 'package:flutter/material.dart';

abstract class BaseWidget<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicWidth(double val) => val * MediaQuery.of(context).size.width;
  double dynamicHeight(double val) => val * MediaQuery.of(context).size.height;
}
