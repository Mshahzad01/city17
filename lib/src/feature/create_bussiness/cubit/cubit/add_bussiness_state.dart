// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_bussiness_cubit.dart';

@immutable
sealed class AddBussinessState {}

final class AddBussinessInitial extends AddBussinessState {}

class AddBussinessLoaded extends AddBussinessState {
  AddBussinessLoaded({
    this.businessModel,
    this.hasError,
    this.loading,
    this.loaded,
    this.message,
  });

  final List<ResponseBussinessModel>? businessModel;
  final bool? hasError;
  final bool? loading;
  final bool? loaded;
  final String? message;
}

class UpdateBussinessState extends AddBussinessState {
  UpdateBussinessState({
    this.hasError,
    this.loading,
    this.loaded,
    this.message,
  });

  final bool? hasError;
  final bool? loading;
  final bool? loaded;
  final String? message;
}

class DeleteBussinessState extends AddBussinessState {
  DeleteBussinessState({
    this.bussinessId,
    this.deleted,
    this.hasError,
    this.message,
    this.loading,
  });

  final String? bussinessId;
  final bool? deleted;
  final bool? hasError;
  final String? message;
  final bool? loading;
}
