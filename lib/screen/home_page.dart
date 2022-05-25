import 'package:flutter/material.dart';
import 'package:prj_cursos/screen/courses/add_course_page.dart';
import 'package:prj_cursos/screen/courses/controller/course_controller.dart';
import 'package:prj_cursos/screen/users/add_user_page.dart';
import 'package:prj_cursos/screen/users/controller/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    AddUserPage(controller: UserController()),
    AddCoursePage(controller: CourseController()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex == 0 ? 'Usuários' : 'Cursos'),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Usuários', icon: Icon(Icons.account_circle)),
          BottomNavigationBarItem(label: 'Cursos', icon: Icon(Icons.school)),
        ],
      ),
    );
  }
}
