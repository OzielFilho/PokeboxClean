import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @action
  toHome() {
    Future.delayed(const Duration(seconds: 5),
        () => Modular.to.pushReplacementNamed('/home/'));
  }
}
