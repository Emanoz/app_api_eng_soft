class Course {
  final String title;
  final String message;
  final String courseName;

  Course({required this.courseName, required this.message, required this.title});

  Course.fromJson(Map<String, dynamic> json)
      : title = json['titulo'],
        message = json['mensagem'],
        courseName = json['nomeCurso'] ?? "";

  Map<String, dynamic> toJson() => {
    'titulo': title,
    'mensagem': message,
    'nomeCurso': courseName,
  };
}
