// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:city17/src/feature/home/forcast_income/model/forcast_model.dart';
import 'package:city17/src/feature/home/model/income_model.dart';

abstract class ForcastState {}

class ForcatDataIntialState extends ForcastState {}

class TextualDataloadeState extends ForcastState {
  TextualDataloadeState({
    this.summaryModel,
    this.loading,
    this.loaded,
    this.hasError,
    this.message,
    this.amount,
    this.seltedtype,
  });

  final SummaryModel? summaryModel;
  final bool? loading;
  final bool? loaded;
  final bool? hasError;
  final String? message;
  final double? amount;
  final IncomeType? seltedtype;
}

class GraphicalDataloadeState extends ForcastState {
  GraphicalDataloadeState({
    this.forcastModel,
    this.loading,
    this.loaded,
    this.hasError,
    this.message,
  });
  final ForcastModel? forcastModel;
  final bool? loading;
  final bool? loaded;
  final bool? hasError;
  final String? message;
}
