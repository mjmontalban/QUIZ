// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:evsu_student/screens/login.dart';
import 'package:evsu_student/screens/videos.dart';
import 'package:evsu_student/screens/questions.dart';




const login = '/';
const videos = '/videos';
const questions = '/questions';



class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => Login());
      case videos:
        return MaterialPageRoute(builder: (context) => Videos());
      case questions:
        return MaterialPageRoute(builder: (context) => Question());
      default:
        return MaterialPageRoute(builder: (context) => Login());
    }
  }
}