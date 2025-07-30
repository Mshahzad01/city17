import 'package:city17/src/services/api_services.dart';

class HomeDataSrc {
  Future getHomeData() async {
    final res = await APIServices.instance.request(
      '/seller/businesses/displays',
      DioMethod.get,
    );
    return res;
  }
}
