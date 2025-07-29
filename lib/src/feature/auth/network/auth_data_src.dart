import 'package:city17/src/services/api_services.dart';

class AuthDataSrc {
  Future signInWithGoogle(String idToken) async {
    final res = await APIServices.instance.request(
      '/auth/google-login',
      DioMethod.post,
      param: {'idToken': idToken},
    );

    return res;
  }

  Future authProfile() async {
    final res = await APIServices.instance.request(
      '/auth/auth-profile',
      DioMethod.get,
    );

    return res;
  }

  // Future updateProfile(EditProfileModel editProfileModel) async {
  //   final toFormData = await editProfileModel.toFormData();
  //   final res = await APIService.instance.request(
  //     '/auth/updateProfile',
  //     DioMethod.patch,
  //     formData: toFormData,
  //   );

  //   return res;
  // }

  Future devlogin() async {
    final res = await APIServices.instance.request(
      '/auth/dev',
      DioMethod.post,
      param: {
        'id': '66a3771271117c91b6f9cbd3', // Luis
      },
    );

    return res;
  }

  Future deleteAccount() async {
    final res = await APIServices.instance.request(
      '/auth/delete',
      DioMethod.delete,
    );

    return res;
  }
}
