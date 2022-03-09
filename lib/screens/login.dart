// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:evsu_student/routes.dart';
import 'package:evsu_student/api/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userId = TextEditingController();
  String message = '';
  bool _isLoading = false;
  bool _showError = false;
  @override
  void dispose() {
    userId.dispose();
    super.dispose();
  }

  login() async {
    if (userId.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      final response = await Api.login(userId.text);
      final Map userdata = await json.decode(response);
      setState(() {
        _isLoading = false;
        _showError = (!userdata['status']) ? true : false;
        message = userdata['message'];
      });
      if (!_showError) {
        Navigator.popAndPushNamed(
          context,
          videos,
        );
      }
    } else {
      return false;
    }
  }

  // checkUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var userdata = prefs.getStringList('user');
  //   if (userdata is List){
  //     Navigator.popAndPushNamed(
  //       context,
  //       scanner,
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("KINDERGARTEN APP"),
        backgroundColor: Colors.red[900],
      ),
      body: LoadingOverlay(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: loginPage(context),
          ),
        ),
        isLoading: _isLoading,
        color: Colors.grey[200],
        // demo of some additional parameters
        opacity: 0.8,
        progressIndicator: SpinKitFadingCube(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }

  Widget loginPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/splash.png',
            height: 200,
            width: 200,
          ),
          SizedBox(
              child: _showError
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : Text("")),
          SizedBox(height: 10),
          TextField(
            controller: userId,
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Student ID',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                login();
              },
              child: Text("Login"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[900]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 16))),
            ),
          ),
        ],
      ),
    );
  }
}
