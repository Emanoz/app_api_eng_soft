enum CourseService {
  getAll,
  insert,
}

extension CourseServiceExtension on CourseService {
  String get url {
    switch(this) {
      case CourseService.getAll:
        return 'topicos';
      case CourseService.insert:
        return 'topicos';
    }
  }
}