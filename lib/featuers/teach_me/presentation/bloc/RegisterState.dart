import 'package:meta/meta.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  // final String username;
  // final String error;
  RegisterLoaded(

      // this.username,
      );
}

class RegisterError extends RegisterState {}
class RegisterResponseError extends RegisterState {}