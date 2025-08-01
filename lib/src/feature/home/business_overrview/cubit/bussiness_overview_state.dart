import 'package:city17/src/feature/home/business_overrview/model/bussiness_overview_model.dart';

abstract class BussinessOverViewState {
  const BussinessOverViewState({this.businessOverViewResponse});

  final List<BussinessOverviewModel>? businessOverViewResponse;
}

class BussinessOverViewInitilaState extends BussinessOverViewState {
  BussinessOverViewInitilaState({required super.businessOverViewResponse});
}

class BussinesOverViewLoadingState extends BussinessOverViewState {
  BussinesOverViewLoadingState({
    super.businessOverViewResponse,
    this.loading = false,
    this.loaded = false,
    this.hasError = false,
    this.message,
    required this.id,
  });

  final bool loading;
  final bool loaded;
  final bool hasError;
  final String? message;
  final String id;
}
