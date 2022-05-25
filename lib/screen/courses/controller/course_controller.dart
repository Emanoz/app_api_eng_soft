import 'package:dio/dio.dart';
import 'package:prj_cursos/api/model/course.dart';
import 'package:prj_cursos/api/service/course_service.dart';
import 'package:prj_cursos/enum/states.dart';
import 'package:prj_cursos/main.dart';
import 'package:mobx/mobx.dart';

part 'course_controller.g.dart';

class CourseController = BaseCourseController with _$CourseController;

abstract class BaseCourseController with Store {
  @observable
  ObservableList<Course> list = ObservableList.of([]);

  @observable
  States currentState = States.done;

  BaseCourseController();

  @action
  Future getAll() async {
    currentState = States.loading;
    final response = await dio.get(baseUrl + CourseService.getAll.url);
    if(response.statusCode == 200) {
      list.clear();
      final data = (response.data as List)
          .map((x) => Course.fromJson(x))
          .toList();
      list.addAll(data);
      currentState = States.done;
    } else {
      currentState = States.error;
    }
  }

  @action
  Future insert(Course course) async {
    currentState = States.loading;
    final response = await dio.post(baseUrl + CourseService.insert.url, data: course);
    if(response.statusCode! >= 200  && response.statusCode! <= 299) {
      list.add(course);
      currentState = States.done;
    } else {
      currentState = States.error;
    }
  }
}