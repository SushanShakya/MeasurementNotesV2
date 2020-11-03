part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<Note> notes;

  NoteSuccess(this.notes);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NoteSuccess && listEquals(o.notes, notes);
  }

  @override
  int get hashCode => notes.hashCode;
}

class NoteFailed extends NoteState {
  final String message;

  NoteFailed(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NoteFailed && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
