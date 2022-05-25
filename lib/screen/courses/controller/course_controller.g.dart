// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseController on BaseCourseController, Store {
  late final _$listAtom =
      Atom(name: 'BaseCourseController.list', context: context);

  @override
  ObservableList<Course> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Course> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$currentStateAtom =
      Atom(name: 'BaseCourseController.currentState', context: context);

  @override
  States get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(States value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('BaseCourseController.getAll', context: context);

  @override
  Future<dynamic> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$insertAsyncAction =
      AsyncAction('BaseCourseController.insert', context: context);

  @override
  Future<dynamic> insert(Course course) {
    return _$insertAsyncAction.run(() => super.insert(course));
  }

  @override
  String toString() {
    return '''
list: ${list},
currentState: ${currentState}
    ''';
  }
}
