import 'package:city17/src/feature/home/forcast_income/cubit/forcast_state.dart';
import 'package:city17/src/feature/home/forcast_income/model/forcast_model.dart';
import 'package:city17/src/feature/home/forcast_income/network/forcast_data_repo.dart';
import 'package:city17/src/feature/home/model/income_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForcastCubit extends Cubit<ForcastState> {
  ForcastCubit() : super(ForcatDataIntialState()) {
    forcastDataRepo = ForcastDataRepo();
  }

  late ForcastDataRepo forcastDataRepo;

  IncomeType _incomeType = IncomeType.day;
  IncomeType get incomeType => _incomeType;

  Future getForcastData() async {
    try {
      final response = forcastDataRepo.getForcastData();

      final ForcastModel summaryResponse = await response;

      emit(TextualDataloadeState(summaryModel: summaryResponse.summary));
    } catch (e) {
      emit(TextualDataloadeState(hasError: true, message: e.toString()));

      rethrow;
    }
  }

  void seletedincometypechange(IncomeType type) {
    _incomeType = type;
    emit(ForcatDataIntialState());
    selectdata();
  }

  // Future selectdata() async {
  //   final response = forcastDataRepo.getForcastData();

  //   final ForcastModel summaryResponse = await response;

  //   List<SummaryModel> data = summaryResponse;

  //   if (_incomeType == IncomeType.day) {
  //     emit();
  //   } else if (_incomeType == IncomeType.week) {
  //     emit();
  //   } else if (_incomeType == IncomeType.month) {
  //     emit();
  //   }
  // }

  Future selectdata() async {
    try {
      final response = await forcastDataRepo.getForcastData();
      final ForcastModel summaryResponse = response;

      double selectedPeriod;

      if (_incomeType == IncomeType.day) {
        selectedPeriod = summaryResponse.summary.daily.amount.toDouble();
      } else if (_incomeType == IncomeType.week) {
        selectedPeriod = summaryResponse.summary.weekly.amount.toDouble();
      } else {
        selectedPeriod = summaryResponse.summary.yearly.amount.toDouble();
      }

      emit(
        TextualDataloadeState(
          summaryModel: summaryResponse.summary,
          amount: selectedPeriod,
          seltedtype: _incomeType,
        ),
      );
    } catch (e) {
      emit(TextualDataloadeState(hasError: true, message: e.toString()));
    }
  }
}
