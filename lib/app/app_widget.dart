import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/utils/theme/Theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokebox',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    ).modular();
  }
}
