import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'imagepick_state.dart';

class ImagepickCubit extends Cubit<ImagepickState> {
  final ImagePicker _imagePicker;
  ImagepickCubit(this._imagePicker) : super(ImagepickInitial());

  Future<void> pickImage(ImageSource source) async {
    emit(ImageLoading());
    try {
      PickedFile f = await _imagePicker.getImage(source: source);
      File f1 = await ImageCropper.cropImage(
          sourcePath: f.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 100,
          maxHeight: 700,
          maxWidth: 700,
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: "Crop Image",
          ));

      emit(ImageSuccess(f1.path));
    } catch (e) {
      emit(ImageError("Could not load image."));
    }
  }
}
