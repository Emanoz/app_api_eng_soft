import 'package:dio/dio.dart';
import 'package:prj_cursos/api/model/user.dart';
import 'package:prj_cursos/enum/states.dart';
import 'package:prj_cursos/main.dart';
import 'package:mobx/mobx.dart';
import '../../../api/service/user_service.dart';

part 'user_controller.g.dart';

class UserController = BaseUserController with _$UserController;

abstract class BaseUserController with Store {
  @observable
  ObservableList<User> list = ObservableList.of([]);

  @observable
  States currentState = States.done;

  BaseUserController();

  @action
  Future getAll() async {
    currentState = States.loading;
    final response = await dio.get(baseUrl + UserService.getAll.url);
    if(response.statusCode == 200) {
      list.clear();
      final data = (response.data as List)
          .map((x) => User.fromJson(x))
          .toList();
      list.addAll(data);
      currentState = States.done;
    } else {
      currentState = States.error;
    }
  }

  @action
  Future insert(User user) async {
    currentState = States.loading;
    final response = await dio.post(baseUrl + UserService.insert.url, data: user);
    if(response.statusCode! >= 200 && response.statusCode! <= 299) {
      list.add(user);
      currentState = States.done;
    } else {
      currentState = States.error;
    }
  }
}