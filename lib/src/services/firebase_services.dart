import 'package:google_sign_in/google_sign_in.dart';

mixin FirebaseService {
  static Future<GoogleSignInAuthentication?> googleAuth() async {
    await GoogleSignIn().signOut();
    await Future.delayed(Duration.zero);
    final googleAuth = await GoogleSignIn().signIn();
    if (googleAuth == null) return null;
    final res = await googleAuth.authentication;
    return res;
  }
}
