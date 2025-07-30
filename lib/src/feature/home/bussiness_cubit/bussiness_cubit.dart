import 'package:city17/src/feature/home/bussiness_cubit/bussiness_state.dart';

import 'package:city17/src/feature/home/network/home_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BussinessCubit extends Cubit<BussinessState> {
  BussinessCubit() : super(BussinessInitilaState(businessResponse: null)) {
    _homeRepo = HomeRepo();
  }
  late HomeRepo _homeRepo;

  Future getBussinesData() async {
    try {
      emit(
        BussinesLoadingState(
          businessResponse: state.businessResponse,
          loading: true,
        ),
      );

      final businessResponse = await _homeRepo.getHomeData();

      emit(
        BussinesLoadingState(businessResponse: businessResponse, loaded: true),
      );
    } catch (e) {
      emit(
        BussinesLoadingState(
          businessResponse: state.businessResponse,
          hasError: true,
          message: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
