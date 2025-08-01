import 'package:city17/src/feature/home/business_overrview/cubit/bussiness_overview_state.dart';
import 'package:city17/src/feature/home/network/home_data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BussinessOverViewCubit extends Cubit<BussinessOverViewState> {
  BussinessOverViewCubit()
    : super(BussinessOverViewInitilaState(businessOverViewResponse: null)) {
    _homeRepo = HomeRepo();
  }

  late HomeRepo _homeRepo;

  Future<void> getBussinesData({required String businessId}) async {
    try {
      emit(
        BussinesOverViewLoadingState(
          id: businessId,
          businessOverViewResponse: state.businessOverViewResponse,
          loading: true,
        ),
      );

      final businessOverViewResponse = await _homeRepo.getbussinessData(
        businessId,
      );

      emit(
        BussinesOverViewLoadingState(
          id: businessId,
          businessOverViewResponse: businessOverViewResponse,
          loaded: true,
        ),
      );
    } catch (e, t) {
      print(e);
      print(t);
      emit(
        BussinesOverViewLoadingState(
          id: businessId,
          businessOverViewResponse: state.businessOverViewResponse,
          hasError: true,
          message: e.toString(),
        ),
      );
    }
  }
}
