import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/core/constant.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/RegisterBloc.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/RegisterEvent.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn(
      {Key? key,
        required this.focusNode,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.country,
        required this.city,
        required this.area,
        required this.password,
        required this.user_type})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController country;
  final TextEditingController city;
  final TextEditingController area;
  final TextEditingController password;
  final String user_type;

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
          print(firstName);
          print(lastName);
          print(email);
          print(phone);
          print(country);
          print(city);
          print(password);
          print(user_type);
          BlocProvider.of<RegisterBloc>(context)
              .add(Register(firstName.text,lastName.text,email.text,phone.text,country.text,city.text,area.text,password.text,user_type));
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    );
  }
}