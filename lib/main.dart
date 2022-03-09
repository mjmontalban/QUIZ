// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: AppRoute.generateRoute,
    initialRoute: login,
    debugShowCheckedModeBanner: false
  ));
}