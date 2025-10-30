import 'package:flutter/widgets.dart';

enum AppSizeClass { mobile, desktop }

AppSizeClass sizeClassFor(BoxConstraints constraints) {
  return constraints.maxWidth <= 599 ? AppSizeClass.mobile : AppSizeClass.desktop;
}
