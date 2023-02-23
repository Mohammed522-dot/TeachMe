import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';



@immutable
abstract class MaterialsEvent {}

class GetMaterial extends MaterialsEvent {
  GetMaterial();
}

