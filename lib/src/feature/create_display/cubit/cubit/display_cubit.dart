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

  Future createDisplay(CreateDisplayModel display) async {
    try {
      emit(CreateDisplayState(loading: true));

      final res = await repo.createDisplay(display);
      emit(CreateDisplayState(displaysModel: res, loaded: true));
    } catch (e) {
      emit(CreateDisplayState(hasError: true, message: e.toString()));
    }
  }

  Future uploadImage(ImageModel image) async {
    try {
      emit(UploadImageState(loading: true));
      final res = await repo.uploadImage(image);

      emit(UploadImageState(imageUrl: res, loading: true));
    } catch (e) {
      emit(UploadImageState(error: true, message: e.toString()));
    }
  }
}
