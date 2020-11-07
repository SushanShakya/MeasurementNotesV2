import 'package:MeasurementNotesV2/Controller/notes_controller.dart';
import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NotesController _controller = NotesController();
  NoteCubit() : super(NoteInitial());

  List<Note> notes = [];

  void getAllNotes() {
    emit(NoteLoading());
    _controller.getNotes().then((value) {
      notes = value;
      if (value.isEmpty) {
        emit(NoteFailed("No Data to Show."));
      } else {
        emit(NoteSuccess(value));
      }
    }).catchError((onError) => emit(NoteFailed("Something went wrong.")));
  }

  void filter(String value) {
    if (value.isEmpty)
      emit(NoteSuccess(notes));
    else
      emit(NoteSuccess(notes
          .where((element) =>
              element.name.toUpperCase().startsWith(value.toUpperCase()))
          .toList()));
  }
}
