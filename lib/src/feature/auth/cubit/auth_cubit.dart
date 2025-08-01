import 'dart:async';
import 'package:city17/src/core/utils/shared_pref_utils.dart';
import 'package:city17/src/feature/auth/model/auth_response.dart';
import 'package:city17/src/feature/auth/network/auth_repo.dart';
import 'package:city17/src/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    _repo = AuthRepo();
  }

  late AuthRepo _repo;

  Future signInWithGoogle() async {
    try {
      final googleAuth = await FirebaseService.googleAuth();
      if (googleAuth == null) return;

      emit(AuthLoading(google: true));

      final userCreds = await FirebaseAuth.instance.signInWithCredential(
        GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ),
      );

      final idToken = await userCreds.user?.getIdToken();

      if (idToken == null) {
        emit(AuthAlert(message: 'ID Token in null'));

        return;
      }

      final res = await _repo.signInWithGoogle(idToken);

      await SharedPrefUtils.saveLoginInfo(res);

      emit(AuthSuccess(authResponse: res));
    } catch (e) {
      emit(AuthAlert(message: e.toString()));
      rethrow;
    }
  }

  Future devAuth() async {
    try {
      final res = await _repo.devAuth();

      await SharedPrefUtils.saveLoginInfo(res);

      emit(AuthSuccess(authResponse: res));
    } catch (e) {
      emit(AuthAlert(message: e.toString()));
      rethrow;
    }
  }

  // Future updateProfile(EditProfileModel editProfileModel) async {
  //   try {
  //     emit(AuthUpdatingProfile(loading: true));
  //     final res = await _repo.updateProfile(editProfileModel);
  //     emit(AuthUpdatingProfile(loaded: true, userModel: res));
  //   } catch (e) {
  //     emit(AuthUpdatingProfile(hasError: true, message: e.toString()));
  //     rethrow;
  //   }
  // }

  Future deleteAccount() async {
    try {
      emit(DeletingAccount(loading: true));
      await _repo.deleteAccount();
      emit(DeletingAccount(loaded: true));
    } catch (e) {
      emit(DeletingAccount(hasError: true, message: e.toString()));
      rethrow;
    }
  }
}
