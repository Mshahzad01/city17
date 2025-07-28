import 'package:city17/src/feature/auth/model/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthResponse? _currentLoginInfo;
AuthResponse? get currentLoginInfo => _currentLoginInfo;

mixin SharedPrefUtils {
  static void setLoginInfo(AuthResponse o) {
    _currentLoginInfo = o;
  }

  static Future saveLoginInfo(AuthResponse res) async {
    final instance = await SharedPreferences.getInstance();
    _currentLoginInfo = res;
    await instance.setString('login_info', res.toJson());
  }

  static Future<AuthResponse?> getLoginInfo() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString('login_info');

    if (res != null) {
      final temp = AuthResponse.fromJson(res);

      _currentLoginInfo = temp;
      return temp;
    }
    return null;
  }

  static Future clearAll() async {
    final instance = await SharedPreferences.getInstance();
    await instance.clear();
    _currentLoginInfo = null;
  }
}
