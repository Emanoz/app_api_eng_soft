enum UserService {
  getAll,
  insert,
}

extension UserServiceExtension on UserService {
  String get url {
    switch(this) {
      case UserService.getAll:
        return 'usuarios';
      case UserService.insert:
        return 'usuarios';
    }
  }
}