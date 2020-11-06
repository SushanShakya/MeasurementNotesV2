part of 'imagepick_cubit.dart';

@immutable
abstract class ImagepickState {}

class ImagepickInitial extends ImagepickState {}

class ImageLoading extends ImagepickState {
  static ImageLoading _l;
  ImageLoading._();
  factory ImageLoading() {
    if (_l == null) _l = ImageLoading._();
    return _l;
  }
}

class ImageSuccess extends ImagepickState {
  final String image;
  ImageSuccess(
    this.image,
  );

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageSuccess && o.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}

class ImageError extends ImagepickState {
  final String message;

  ImageError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
