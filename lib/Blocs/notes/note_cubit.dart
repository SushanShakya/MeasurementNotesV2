import 'package:MeasurementNotesV2/Controller/notes_controller.dart';
import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NotesController _controller = NotesController();
  NoteCubit() : super(NoteInitial());

  void getAllNotes() {
    emit(NoteLoading());
    _controller.getNotes().then((value) {
      if (value.isNotEmpty)
        emit(NoteSuccess(value));
      else
        emit(NoteFailed("No Data to Show"));
    }).catchError((onError) => emit(NoteFailed("Something went wrong.")));
  }
}
