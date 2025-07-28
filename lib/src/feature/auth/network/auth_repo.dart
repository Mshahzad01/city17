import 'package:city17/src/core/model/my_exception.dart';
import 'package:city17/src/core/utils/log_utils.dart';
import 'package:city17/src/feature/auth/model/auth_response.dart';
import 'package:city17/src/feature/auth/network/auth_data_src.dart';

abstract class _AuthRepo {
  Future<AuthResponse> signInWithGoogle(String idToken);

  Future<AuthResponse> authProfile();

  Future deleteAccount();
}

class AuthRepo implements _AuthRepo {
  AuthRepo() {
    _dataSrc = AuthDataSrc();
  }

  late AuthDataSrc _dataSrc;

  @override
  Future<AuthResponse> signInWithGoogle(String idToken) async {
    final res = await _dataSrc.signInWithGoogle(idToken);
    LogUtils.printLog(['--------Google Login Response', res.data]);
    if (res.data['success']) {
      return AuthResponse.fromMap(res.data);
    }
    throw MyException(res.data['message']);
  }

  @override
  Future<AuthResponse> authProfile() async {
    final res = await _dataSrc.authProfile();
    LogUtils.printLog(['--------Auth Profile Response', res.data]);
    if (res.data['success']) {
      return AuthResponse.fromMap(res.data);
    }
    throw MyException(res.data['message']);
  }

  // @override
  // Future<UserModel> updateProfile(EditProfileModel editProfileModel) async {
  //   final res = await _dataSrc.updateProfile(editProfileModel);
  //   LogUtils.printLog(['--------Update profile Response', res.data]);
  //   if (res.data['success']) {
  //     return UserModel.fromMap(res.data['user']);
  //   }
  //   throw MyException(res.data['message']);
  // }

  @override
  Future deleteAccount() async {
    final res = await _dataSrc.deleteAccount();
    LogUtils.printLog(['--------Delete Account Response', res.data]);
    if (res.data['success']) {
      return;
    }
    throw MyException(res.data['message']);
  }
}
