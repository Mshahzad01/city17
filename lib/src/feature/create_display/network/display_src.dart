import 'package:city17/src/feature/create_display/model/create_display_model.dart';
import 'package:city17/src/feature/create_display/model/image_model.dart';
import 'package:city17/src/services/api_services.dart';

class DisplaySrc {
  Future createDisplay(CreateDisplayModel display) async {
    final res = await APIServices.instance.request(
      '/tvRoute/create-display',
      DioMethod.post,

      param: display.toMap(),
    );
    return res;
  }

  Future uploadImage(ImageModel image) async {
    final formdata = await image.toconvertImage();
    final res = await APIServices.instance.request(
      '/admin/upload-images',
      DioMethod.post,
      formData: formdata,
    );

    return res;
  }
}
