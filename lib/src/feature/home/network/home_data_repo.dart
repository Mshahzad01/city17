import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/home/model/business_model.dart';
import 'package:city17/src/feature/home/network/home_data_src.dart';

abstract class _HomeRepo {
  Future<List<BusinessModel>> getHomeData();
}

class HomeRepo implements _HomeRepo {
  HomeRepo() {
    _homeDataSrc = HomeDataSrc();
  }
  late HomeDataSrc _homeDataSrc;
  @override
  Future<List<BusinessModel>> getHomeData() async {
    final res = await _homeDataSrc.getHomeData();
    LogUtils.printLog(['...........Busines Response', res.data]);
    if (res.data['success']) {
      if (res.data != null) {
        LogUtils.printLog([
          '...........Busines Response..............',
          res.data,
        ]);

        return List<BusinessModel>.from(
          res.data['businesses'].map((e) => BusinessModel.fromMap(e)),
        );
      }
    }
    throw MyException(res.data['message']);
  }
}
