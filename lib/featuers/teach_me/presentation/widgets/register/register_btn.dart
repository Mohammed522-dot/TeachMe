import 'package:flutter/material.dart';
import 'package:teachme/core/constant.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn(
      {Key? key,
        required this.focusNode,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
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
          // BlocProvider.of<AuthBloc>(context)
          //     .add(Login(userName.text, password.text));
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}