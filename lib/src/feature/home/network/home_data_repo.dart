import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/home/business_overrview/model/bussiness_overview_model.dart';
import 'package:city17/src/feature/home/model/business_model.dart';
import 'package:city17/src/feature/home/network/home_data_src.dart';

abstract class _HomeRepo {
  Future<List<BusinessModel>> getHomeData();
  Future<List<BussinessOverviewModel>> getbussinessData(String bussinesId);
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
        return List<BusinessModel>.from(
          res.data['businesses'].map((e) => BusinessModel.fromMap(e)),
        );
      }
    }
    throw MyException(res.data['message']);
  }

  @override
  Future<List<BussinessOverviewModel>> getbussinessData(
    String bussinesId,
  ) async {
    final res = await _homeDataSrc.getData(bussinesId);
    LogUtils.printLog(['...........BusinesOverView Response', res.data]);
    if (res.data['success']) {
      if (res.data != null) {
        return List<BussinessOverviewModel>.from(
          res.data['data'].map((e) => BussinessOverviewModel.fromMap(e)),
        );
      }
    }
    throw MyException(res.data['message']);
  }
}
