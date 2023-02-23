import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/AuthState.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/RegisterEvent.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/RegisterState.dart';




  class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
    RegisterBloc() : super(RegisterInitial()) {
      on<RegisterEvent>((event, emit) async {
        if (event is Register) {
          if (event.fname.isEmpty || event.lname.isEmpty || event.email.isEmpty || event.phone.isEmpty || event.country.isEmpty || event .city.isEmpty
              ||event.location.isEmpty || event.password.isEmpty ||event.type_user.isEmpty) {
            emit(RegisterError());
          } else {
            emit(RegisterLoading());
            Response response = await post(
              Uri.parse('http://vidamed-001-site4.atempurl.com/user/new'),
              body: {
                'fname' : event.fname,
                'lname' : event.lname,
                'email' : event.email,
                'phone' : event.phone,
                'contry': event.country,
                'city'  :   event.city,
                'location': event.location,
                'password': event.password,
                'type_user': event.type_user
              }
          );
          if(response.statusCode == 200){
            final body = jsonDecode(response.body);
            // SharedPreferences pref = await SharedPreferences.getInstance();
            // await pref.setString('AccessToken', body['accessToken']);
            // print(pref.get("AccessToken"));
             emit(RegisterLoaded());
          }
          else {
           //  final error = jsonDecode(response.body);
           // await error['errors']['en'];
            print(response.statusCode);
            emit(RegisterResponseError());
            // print(error);
          }
        }
      }
    });
  }
}
