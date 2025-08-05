import 'package:city17/src/feature/create_bussiness/model/add_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/model/response_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/model/update_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/network/add_bussiness_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_bussiness_state.dart';

class AddBussinessCubit extends Cubit<AddBussinessState> {
  AddBussinessCubit() : super(AddBussinessInitial()) {
    _repo = AddBussinessRepo();
  }

  late AddBussinessRepo _repo;

  Future addBussiness(AddBussinessModel addBussinessModel) async {
    try {
      emit(AddBussinessLoaded(loading: true));

      final res = await _repo.adBussiness(addBussinessModel);

      emit(AddBussinessLoaded(loaded: true, businessModel: res));
    } catch (e) {
      emit(AddBussinessLoaded(hasError: true, message: e.toString()));
      rethrow;
    }
  }

  Future updateBussiness(UpdateBussinessModel updateBussiness) async {
    try {
      emit(UpdateBussinessState(loading: true));
      await _repo.updateBussiness(updateBussiness);

      emit(UpdateBussinessState(loaded: true));
    } catch (e) {
      emit(UpdateBussinessState(hasError: true, message: e.toString()));

      rethrow;
    }
  }

  Future deleteBussiness(String bussinessId) async {
    try {
      emit(DeleteBussinessState(loading: true));
      await _repo.deleteBussiness(bussinessId);

      emit(DeleteBussinessState(bussinessId: bussinessId, deleted: true));
    } catch (e) {
      emit(DeleteBussinessState(hasError: true, message: e.toString()));
    }
  }
}
