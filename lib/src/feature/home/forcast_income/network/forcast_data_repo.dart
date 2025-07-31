import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/home/forcast_income/model/forcast_model.dart';
import 'package:city17/src/feature/home/forcast_income/network/forcast_data_src.dart';

abstract class _ForcastDataRepo {
  Future<ForcastModel> getForcastData();
}

class ForcastDataRepo implements _ForcastDataRepo {
  ForcastDataRepo() {
    forcastDataSrc = ForcastDataSrc();
  }

  late ForcastDataSrc forcastDataSrc;

  @override
  Future<ForcastModel> getForcastData() async {
    final res = await forcastDataSrc.getforcastData();
    LogUtils.printLog(['..........Forcast Data........', res.data]);

    if (res.data['success']) {
      if (res.data != null) {
        return ForcastModel.fromMap(res.data['forCast']);
      }
    }
    throw MyException(res.data['message']);
  }
}
