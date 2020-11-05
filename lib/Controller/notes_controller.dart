import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:MeasurementNotesV2/Storage/db2.dart';

class NotesController {
  static NotesController _controller;

  NotesController._();

  factory NotesController() {
    if (_controller == null) _controller = NotesController._();
    return _controller;
  }

  DbHelper _db = DbHelper();

  Future<List<Note>> getNotes() async {
    List<Map<String, dynamic>> data = await _db.fetchCustomerMeasurements();

    print(data);

    return List<Note>.from(data.map((e) => Note.fromMap(e)).toList());
  }

  Future insertNote(Note note) => _db.insertNote(note);

  Future updateNotes(Note note) => _db.updateMeasurements(note);

  Future deleteNote(int id) => _db.deleteNote(id);
}
