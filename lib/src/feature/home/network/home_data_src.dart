import 'package:city17/src/services/api_services.dart';

class HomeDataSrc {
  Future getHomeData() async {
    final res = await APIServices.instance.request(
      '/seller/businesses/displays',
      DioMethod.get,
    );
    return res;
  }

  Future getData(String businessId) async {
    final res = await APIServices.instance.request(
      '/seller/display-overview/$businessId', // <-- yeh correct hai
      DioMethod.get,
    );
    return res;
  }
}
