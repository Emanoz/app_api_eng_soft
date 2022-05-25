class User {
  final String name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['nome'],
        email = json['email'],
        password = json['senha'];

  Map<String, dynamic> toJson() => {
    'nome': name,
    'email': email,
    'senha': password,
  };
}
