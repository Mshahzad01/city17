part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  AuthLoading({this.google = false});
  final bool google;
}

final class AuthSuccess extends AuthState {
  AuthSuccess({required this.authResponse});
  final AuthResponse authResponse;
}

final class AuthAlert extends AuthState {
  AuthAlert({required this.message});
  final String message;
}

final class AuthUpdatingProfile extends AuthState {
  AuthUpdatingProfile({
    this.loading = false,
    this.loaded = false,
    this.hasError = false,
    this.message,
    this.userModel,
  });
  final bool loading;
  final bool loaded;
  final bool hasError;
  final String? message;
  final UserModel? userModel;
}

final class DeletingAccount extends AuthState {
  DeletingAccount({
    this.loading = false,
    this.loaded = false,
    this.hasError = false,
    this.message,
  });
  final bool loading;
  final bool loaded;
  final bool hasError;
  final String? message;
}
