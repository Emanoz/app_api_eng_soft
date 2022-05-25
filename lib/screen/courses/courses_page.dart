import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prj_cursos/api/model/course.dart';
import 'package:prj_cursos/enum/states.dart';
import 'package:prj_cursos/screen/courses/controller/course_controller.dart';

class CoursesPage extends StatefulWidget {
  final CourseController controller;

  const CoursesPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    widget.controller.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Observer(
          builder: (context) {
            return widget.controller.currentState == States.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount: widget.controller.list.length,
                    itemBuilder: (_, index) => Card(
                      elevation: 3.0,
                      child: ListTile(
                        leading: ClipRRect(child: Image.network('https://picsum.photos/200')),
                        title: Text(widget.controller.list[index].title),
                        subtitle: Text(widget.controller.list[index].courseName),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      height: 16.0,
                    ),
                  );
          }
        ),
      ),
    );
  }
}
