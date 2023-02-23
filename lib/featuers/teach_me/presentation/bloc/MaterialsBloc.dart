import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:teachme/featuers/teach_me/data/datasourse/models/Materials.dart';
import 'package:teachme/featuers/teach_me/presentation/bloc/MaterialsState.dart';
import 'MaterialsEvent.dart';

class MaterialsBloc extends Bloc<MaterialsEvent, MaterialsState> {
  MaterialsBloc() : super(MaterialsInitial()) {
    on<MaterialsEvent>((event, emit) async {
      if (event is GetMaterial) {
          emit(MaterialsLoading());
          Response response = await get(
              Uri.parse('https://wow.arthub.ae/public/api/last_products'),
          );
          if(response.statusCode == 200){
            final json = jsonDecode(response.body);
            // final parsed = jsonDecode(response.body).cast<String, dynamic>();
            var data = List<Materials>.from(json['data'].map((x) => Materials.fromJson(x)));
            print(data);
            emit(MaterialsLoaded(materials: data));
          }
          else {
            final error = jsonDecode(response.body);
            await error['errors']['en'];
            emit(MaterialsError());
            print(error);
          }
        }
    });
  }
}