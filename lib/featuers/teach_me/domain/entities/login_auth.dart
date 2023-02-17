import 'package:equatable/equatable.dart';

class AuthLogin extends Equatable{
    final String email;
    final String password;

    AuthLogin({required this.email,required this.password}): super([email,password]);
}