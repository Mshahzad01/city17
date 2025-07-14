import 'package:city17/src/feature/home/cubit/home_state.dart';
import 'package:city17/src/feature/home/model/income_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(initialstat());

  String seletedincometype = IncomeType.day.title;

  String seletedtype =IncomeType.day.title; //"Today";

  List<ChartData> day = dayData;
  List<ChartData> week = weekData;
  List<ChartData> month = monthData;

  List<IncomeModel> totalincome = incomedata;

  void getChartData(String type) {
    seletedtype = type;
    final List<ChartData> selectedData;
    final List<IncomeModel> selectedIncomeData;
    switch (type) {
      case 'Today':
        selectedData = dayData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.day)
            .toList();

        break;
      case 'Week':
        selectedData = weekData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.week)
            .toList();
        break;
      case 'Month':
        selectedData = monthData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.month)
            .toList();
        break;
      default:
        selectedData = dayData;
        selectedIncomeData = incomedata
            .where((income) => income.incomeType == IncomeType.day)
            .toList();
    }
    emit(chartdatasate(seletedtype, selectedData, selectedIncomeData));
  }

  void newfun  () {
    getChartData(seletedtype);

  }

  void seletedincometypechange(String type) {
    seletedincometype = IncomeType.fromTitle(type).title;
    emit(initialstat());
    selectdata();
  }

  void selectdata() {
    List<IncomeModel> data = incomedata;

    if (seletedincometype == IncomeType.day.title) {
      emit(dataloadedstate(data[0].income, data[0].percentage));
    } else if (seletedincometype == IncomeType.week.title) {
      emit(dataloadedstate(data[1].income, data[1].percentage));
    } else if (seletedincometype == IncomeType.month.title) {
      emit(dataloadedstate(data[2].income, data[2].percentage));
    }
  }
}
