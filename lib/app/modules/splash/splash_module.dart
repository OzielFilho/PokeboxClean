import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/modules/home/home_module.dart';
import 'package:pokebox/app/modules/splash/presenter/splash_controller.dart';
import 'package:pokebox/app/modules/splash/presenter/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
