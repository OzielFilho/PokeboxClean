import 'package:mobx/mobx.dart';
import 'package:pokebox/app/modules/home/domain/entities/result.dart';
import 'package:pokebox/app/modules/home/domain/usecases/search_by_len.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final SearchByLen searchByLen;

  _HomeControllerBase(this.searchByLen) {
    getData(50);
  }

  @observable
  List<Result> pokemons = [];

  @action
  Future<void> getData(int len) async {
    var result = await searchByLen(len);
    return result.fold(
      (failure) => failure,
      (data) => pokemons = data,
    );
  }
}
