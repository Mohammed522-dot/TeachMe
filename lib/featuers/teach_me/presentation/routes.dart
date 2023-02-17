import 'package:flutter/material.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/home_page.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/login_page.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/register_page.dart';
import 'package:teachme/main.dart';
Map<String, Widget Function(BuildContext)> routes = {

  'homePage': (_) => HomePage(),
  'registerPage': (_) => RegisterPage(),
  'mainPage': (_) => MyApp(),

} as Map<String, Widget Function(BuildContext p1)>;