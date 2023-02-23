import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../data/datasourse/models/Materials.dart';

@immutable
abstract class MaterialsState {}

class MaterialsInitial extends MaterialsState {}

class MaterialsLoading extends MaterialsState {}

class MaterialsLoaded extends MaterialsState {
  final List<Materials> materials;
  MaterialsLoaded({ required this.materials,});
}

class MaterialsError extends MaterialsState {}