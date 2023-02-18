import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/core/classes/language_constants.dart';
import 'package:teachme/core/constant.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthBloc.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthEvent.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/home.dart';
import 'package:teachme/featuers/teach_me/presentation/pages/home_page.dart';



class LoginBtn extends StatelessWidget {
  const LoginBtn(
      {Key? key,
        required this.focusNode,
        required this.userName,
        required this.password})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController userName;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHPadding,
       child:
        OutlinedButton(
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color:  Colors.blue, width: 1),
            minimumSize: const Size(double.infinity, 54),
            backgroundColor:  Colors.blue),
        onPressed: () {
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          BlocProvider.of<AuthBloc>(context)
              .add(Login(userName.text, password.text));
        },
        child: Text(
          translation(context).login,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}

