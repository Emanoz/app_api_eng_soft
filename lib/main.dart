import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prj_cursos/screen/home_page.dart';

const String baseUrl = 'https://cursos010.herokuapp.com/';
final Dio dio = Dio();

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
