import 'package:city17/src/feature/home/cubit/home_state.dart';
import 'package:city17/src/feature/home/model/income_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Initialstat());

  IncomeType _incomeType = IncomeType.day;
  IncomeType get incomeType => _incomeType;

  List<ChartData> day = dayData;
  List<ChartData> week = weekData;
  List<ChartData> month = monthData;

  List<IncomeModel> totalincome = incomedata;

  void getChartData(IncomeType type) {
    _incomeType = type;
    final List<ChartData> selectedData;
    final List<IncomeModel> selectedIncomeData;
    switch (type) {
      case IncomeType.day:
        selectedData = dayData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.day)
            .toList();

        break;
      case IncomeType.week:
        selectedData = weekData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.week)
            .toList();
        break;
      case IncomeType.month:
        selectedData = monthData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.month)
            .toList();
        break;
    }
    emit(Chartdatasate(_incomeType, selectedData, selectedIncomeData));
  }

  void newfun() {
    getChartData(_incomeType);
  }

  void seletedincometypechange(IncomeType type) {
    _incomeType = type;
    emit(Initialstat());
    selectdata();
  }

  void selectdata() {
    List<IncomeModel> data = incomedata;

    if (_incomeType == IncomeType.day) {
      emit(Dataloadedstate(data[0].income, data[0].percentage));
    } else if (_incomeType == IncomeType.week) {
      emit(Dataloadedstate(data[1].income, data[1].percentage));
    } else if (_incomeType == IncomeType.month) {
      emit(Dataloadedstate(data[2].income, data[2].percentage));
    }
  }
}
