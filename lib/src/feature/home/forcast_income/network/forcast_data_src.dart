import 'package:city17/src/services/api_services.dart';

class ForcastDataSrc {
  Future getforcastData() async {
    final res = await APIServices.instance.request(
      '/seller/fore-cast',
      DioMethod.get,
    );

    return res;
  }
}
