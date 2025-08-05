import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/create_bussiness/model/add_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/model/response_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/model/update_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/network/add_bussiness_src.dart';

abstract class _AddBussinessRopo {
  Future<List<ResponseBussinessModel>> adBussiness(
    AddBussinessModel addBussinessModel,
  );

  Future updateBussiness(UpdateBussinessModel updateBussinessModel);

  Future deleteBussiness(String bussinessId);
}

class AddBussinessRepo extends _AddBussinessRopo {
  AddBussinessRepo() {
    _addBussinessSrc = AddBussinessSrc();
  }

  late AddBussinessSrc _addBussinessSrc;

  @override
  Future<List<ResponseBussinessModel>> adBussiness(
    AddBussinessModel addBussinessModel,
  ) async {
    final res = await _addBussinessSrc.addBussiness(addBussinessModel);

    LogUtils.printLog(['......Ad Bussines.......', res.data]);

    if (res.data['success']) {
      final businessData = res.data['business'];
      return [ResponseBussinessModel.fromMap(businessData)];
    }

    throw MyException(res.data['message']);
  }

  @override
  Future updateBussiness(UpdateBussinessModel updateBussinessModel) async {
    final res = await _addBussinessSrc.updateBussiness(updateBussinessModel);
    LogUtils.printLog(['.....Update Bussiness......', res.data]);

    if (res.data['success']) {
      return; //ResponseBussinessModel.fromMap(res.data);
    }
    throw MyException(res.data['message']);
  }

  @override
  Future deleteBussiness(String bussinessId) async {
    final res = await _addBussinessSrc.deleteBussiness(bussinessId);
    LogUtils.printLog(['.....Delete Bussiness.....', res.data]);

    if (res.data['success']) {
      return;
    }
    throw MyException(res.data['message']);
  }
}
