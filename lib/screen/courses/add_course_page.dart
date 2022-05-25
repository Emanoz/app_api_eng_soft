import 'package:flutter/material.dart';
import 'package:prj_cursos/api/model/course.dart';
import 'package:prj_cursos/screen/courses/controller/course_controller.dart';
import 'package:prj_cursos/screen/courses/courses_page.dart';

class AddCoursePage extends StatelessWidget {
  final CourseController controller;
  final titleController = TextEditingController();
  final courseController = TextEditingController();
  final messageController = TextEditingController();

  AddCoursePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Título'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: courseController,
              decoration: const InputDecoration(hintText: 'Nome do curso'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: messageController,
              decoration: const InputDecoration(hintText: 'Mensagem'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                  onPressed: () async {
                    await controller.insert(
                      Course(
                        message: messageController.text,
                        courseName: courseController.text,
                        title: titleController.text,
                      ),
                    );
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CoursesPage(controller: controller)));
                  },
                  child: const Text('Cadastrar')),
            ),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => CoursesPage(
                          controller: controller,
                        ))),
                child: const Text('Visualizar todos')),
          ],
        ),
      ),
    );
  }
}
