import 'package:bloc/bloc.dart';
import 'package:city17/src/feature/create_display/model/create_display_model.dart';
import 'package:city17/src/feature/create_display/model/image_model.dart';
import 'package:city17/src/feature/create_display/network/display_repo.dart';
import 'package:city17/src/feature/home/model/displays_model.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'display_state.dart';

class DisplayCubit extends Cubit<DisplayState> {
  DisplayCubit() : super(DisplayInitial()) {
    repo = DisplayRepo();
  }

  late DisplayRepo repo;
  CreateDisplayModel? _displaysModel;

  CreateDisplayModel? get displaymodel => _displaysModel;

  void setDisplayModel(CreateDisplayModel model) {
    _displaysModel = model;
  }

  Future createDisplay() async {
    if (_displaysModel == null) {
      emit(CreateDisplayState(hasError: true, message: "Model is empty."));
      return;
    }
    try {
      emit(CreateDisplayState(loading: true));

      final res = await repo.createDisplay(_displaysModel!);
      emit(CreateDisplayState(displaysModel: res, loaded: true));
    } catch (e) {
      emit(CreateDisplayState(hasError: true, message: e.toString()));
    }
  }

  Future uploadImage(ImageModel image) async {
    try {
      emit(UploadImageState(loading: true));
      final res = await repo.uploadImage(image);

      emit(UploadImageState(imageUrl: res, loaded: true));
    } catch (e) {
      emit(UploadImageState(error: true, message: e.toString()));
    }
  }
}
