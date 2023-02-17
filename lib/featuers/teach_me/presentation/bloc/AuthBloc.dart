import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthEvent.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthState.dart';




  class AuthBloc extends Bloc<AuthEvent, AuthState> {
    AuthBloc() : super(AuthInitial()) {
      on<AuthEvent>((event, emit) async {
        if (event is Login) {
          if (event.email.isEmpty || event.password.isEmpty) {
            emit(AuthError());
          } else {
            emit(AuthLoading());
            Response response = await post(
              Uri.parse('http://vidamed-001-site4.atempurl.com/Login/users/'),
              body: {
                'email' : event.email,
                'password': event.password
              }
          );
          if(response.statusCode == 200){
            final body = jsonDecode(response.body);
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString('AccessToken', body['accessToken']);
            // await pref.setInt('UserID', body["data"]['id']);
            // await pref.setString('UserName', body["data"]['name']);
            // await pref.setString('Phone', body["data"]['phone']);
            // await pref.setString('email', body["data"]['email']);
            print(pref.get("AccessToken"));
            // print(pref.get("UserName"));
             emit(AuthLoaded());
          }
          else {
            final error = jsonDecode(response.body);
           await error['errors']['en'];
            emit(ResponseError());
            print(error);
          }
        }
      }
    });
  }
}
