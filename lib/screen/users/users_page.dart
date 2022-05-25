import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prj_cursos/api/model/user.dart';
import 'package:prj_cursos/enum/states.dart';
import 'package:prj_cursos/screen/users/controller/user_controller.dart';

class UsersPage extends StatefulWidget {
  final UserController controller;

  const UsersPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    widget.controller.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
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
                        title: Text(widget.controller.list[index].name),
                        subtitle: Text(widget.controller.list[index].email),
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
