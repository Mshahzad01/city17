import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/create_display/model/create_display_model.dart';
import 'package:city17/src/feature/create_display/model/image_model.dart';
import 'package:city17/src/feature/create_display/network/display_src.dart';
import 'package:city17/src/feature/home/model/displays_model.dart';

abstract class _DisplayRepo {
  Future<DisplaysModel?> createDisplay(CreateDisplayModel displayModel);

  Future<List<ImageUrl>> uploadImage(ImageModel image);
}

class DisplayRepo implements _DisplayRepo {
  DisplayRepo() {
    _displaySrc = DisplaySrc();
  }
  late DisplaySrc _displaySrc;
  @override
  Future<DisplaysModel?> createDisplay(CreateDisplayModel displayModel) async {
    final res = await _displaySrc.createDisplay(displayModel);

    LogUtils.printLog(['.........Create Display..........', res.data]);

    if (res.data['success']) {
      return DisplaysModel.fromMap(res.data);
    }

    throw MyException(res.data['message']);
  }

  @override
  Future<List<ImageUrl>> uploadImage(ImageModel image) async {
    final res = await _displaySrc.uploadImage(image);

    LogUtils.printLog(['........Upload Image........', res.data]);

    if (res.data['success']) {
      return List<ImageUrl>.from(
        (res.data['data'] as List).map((e) => ImageUrl(image: e.toString())),
      );
    }

    throw MyException(res);
  }
}
