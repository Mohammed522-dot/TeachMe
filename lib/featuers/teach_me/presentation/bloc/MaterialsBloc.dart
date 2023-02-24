import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachme/featuers/teach_me/data/datasourse/models/Materials.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/MaterialsEvent.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/MaterialsState.dart';

class MaterialsBloc extends Bloc<MaterialsEvent, MaterialsState> {
  MaterialsBloc() : super(MaterialsInitial()) {
    on<MaterialsEvent>((event, emit) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final String token = preferences.getString("AccessToken").toString();
      if (event is GetMaterial) {
          emit(MaterialsLoading());
          Response response = await get(
              Uri.parse('http://vidamed-001-site4.atempurl.com/Materials/All'),
            headers: {'access-token':token}
          );
          if(response.statusCode == 200){
            final json = jsonDecode(response.body);
            var data = List<Materials>.from(json['data'].map((x) => Materials.fromJson(x)));
            print(data);
            emit(MaterialsLoaded(materials: data));
          }
          else {
            final error = response.statusCode;
            //await error['errors']['en'];
            emit(MaterialsError());
            print(error);
          }
        }
    });
  }
}