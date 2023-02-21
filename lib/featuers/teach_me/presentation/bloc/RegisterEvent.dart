import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';



@immutable
abstract class RegisterEvent {}

class Register extends RegisterEvent {
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final String country;
  final String city;
  final String location;
  final String password;
  final String type_user;
  Register(this.fname,this.lname,this.email, this.phone,this.country,this.city,this.location, this.password,this.type_user);
}

