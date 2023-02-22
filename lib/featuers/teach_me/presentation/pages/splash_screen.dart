import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/login_page.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/roort_app.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/signUp_page.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, isLoged);
  }

  isLoged() async{
    var userPref = await SharedPreferences.getInstance();
    String token = userPref.get("AccessToken").toString();

    if(token.isEmpty){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => const LoginPage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const RootApp()));
    }
  }

  // route() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(
  //       builder: (context) => LoginPage()
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xFFF2F8FF),
                gradient: LinearGradient(colors: [(new  Color(0xFFF2F8FF)), new Color(0xFFF2F8FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/Teach-me-logo.png"),
            ),
          )
        ],
      ),
    );
  }
}