import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/core/AppTheme.dart';
import 'package:teachme/core/constant.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthBloc.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthState.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/home_page.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/roort_app.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/signUp_page.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/lodingWidget.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/login/input_field.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/login/login_btn.dart';
import 'package:teachme/featuers/teach_me/presentation/widgets/spacer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, }) : super(key: key);

  // final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc())
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme
              .of(context)
              .primaryBtnText,
          automaticallyImplyLeading: false,
          title: Text(
            'Login',
            style: AppTheme
                .of(context)
                .subtitle2
                .override(
              fontFamily: 'Lexend Deca',
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body:BlocConsumer<AuthBloc,AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              buildErrorLayout();
            } else if (state is AuthLoaded) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RootApp()));
            }
            else if (state is ResponseError) {
              ResponseErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return LoadingWidget(child: buildInitialInput());
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }
  Widget buildInitialInput() => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        margin: EdgeInsets.only(top: 50),
        child: Image.asset(
          "Teach-me-logo.png",
          height: 150,
          width: 150,
        ),
      ),

        // ImageBuilder(imagePath: loginImages[0]),
        // const TextData(message: "User"),
        HeightSpacer(myHeight: kSpacing),
        Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child:  InputField(
              focusNode: usernameFocus,
              textController: userName,
              label: "Email",
              icons: const Icon(Icons.email, color: Colors.blue),
            ),
        ),
        HeightSpacer(myHeight: kSpacing),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: InputField(
            focusNode: passwordFocus,
            textController: password,
            label: "Password",
            icons: const Icon(Icons.lock, color: Colors.blue),
          ),
        ),
        HeightSpacer(myHeight: kSpacing),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: LoginBtn(
            focusNode: loginBtnFocus,
            userName: userName,
            password: password,
          ),
        ),
        const SizedBox(height: 50),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text( 'Don\' have an account?',style: TextStyle( fontSize: 17, color: Colors.black)),
              const SizedBox(width: 5),
              GestureDetector(
                  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));},
                  child: Text('Sign Up', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color:Colors.blue ),)
              ),
            ]
        ),
      ],
    ),
  );
  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );
  ScaffoldFeatureController ResponseErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Data!'),
        ),
      );

  clearTextData() {
    userName.clear();
    password.clear();

  }
}