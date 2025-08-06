// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'display_cubit.dart';

@immutable
sealed class DisplayState {}

final class DisplayInitial extends DisplayState {}

class CreateDisplayState extends DisplayState {
  CreateDisplayState({
    this.message,
    this.hasError,
    this.loading,
    this.loaded,
    this.displaysModel,
  });

  final String? message;
  final bool? hasError;
  final bool? loading;
  final bool? loaded;
  final DisplaysModel? displaysModel;
}

class UploadImageState extends DisplayState {
  UploadImageState({
    this.loading,
    this.loaded,
    this.error,
    this.message,
    this.imageUrl,
  });

  final bool? loading;
  final bool? loaded;
  final bool? error;
  final String? message;
  final List<ImageUrl>? imageUrl;
}
