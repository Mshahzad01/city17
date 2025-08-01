import 'package:city17/src/feature/home/model/business_model.dart';

abstract class BussinessState {
  const BussinessState({required this.businessResponse});

  final List<BusinessModel>? businessResponse;
}

class BussinessInitilaState extends BussinessState {
  BussinessInitilaState({required super.businessResponse});
}

class BussinesLoadingState extends BussinessState {
  BussinesLoadingState({
    super.businessResponse,
    this.loading = false,
    this.loaded = false,
    this.hasError = false,
    this.message,
  });

  final bool loading;
  final bool loaded;
  final bool hasError;
  final String? message;
}
