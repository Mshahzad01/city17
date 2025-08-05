import 'package:city17/src/feature/create_bussiness/model/add_bussiness_model.dart';
import 'package:city17/src/feature/create_bussiness/model/update_bussiness_model.dart';
import 'package:city17/src/services/api_services.dart';

class AddBussinessSrc {
  Future addBussiness(AddBussinessModel adBussinesModel) async {
    final res = await APIServices.instance.request(
      '/seller/create-business',
      DioMethod.post,
      param: adBussinesModel.toMap(),
    );
    return res;
  }

  Future updateBussiness(UpdateBussinessModel updateBussiness) async {
    final res = await APIServices.instance.request(
      '/seller/update-business',
      DioMethod.patch,
      param: updateBussiness.toMap(),
    );
    return res;
  }

  Future deleteBussiness(String bussinessId) async {
    final res = await APIServices.instance.request(
      '/seller/delete-business',
      DioMethod.delete,

      param: {'businessId': bussinessId},
    );
    return res;
  }
}
