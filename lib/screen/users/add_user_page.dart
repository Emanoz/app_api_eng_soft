import 'package:flutter/material.dart';
import 'package:prj_cursos/screen/users/controller/user_controller.dart';
import '../../api/model/user.dart';
import 'users_page.dart';

class AddUserPage extends StatelessWidget {
  final UserController controller;
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  final emailController = TextEditingController();

  AddUserPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          children: [
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(hintText: 'Usuário'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'E-mail'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: pwdController,
              decoration: const InputDecoration(hintText: 'Senha'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                  onPressed: () async {
                    await controller.insert(
                      User(
                        email: emailController.text,
                        name: userController.text,
                        password: pwdController.text,
                      ),
                    );
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => UsersPage(controller: controller)));
                  },
                  child: const Text('Cadastrar')),
            ),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => UsersPage(
                          controller: controller,
                        ))),
                child: const Text('Visualizar todos')),
          ],
        ),
      ),
    );
  }
}
