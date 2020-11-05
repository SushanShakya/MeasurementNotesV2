import 'package:MeasurementNotesV2/Models/note_model.dart';

abstract class IDb {
  open();

  Future<List<Map<String, dynamic>>> fetchCustomerMeasurements();
  Future insertNote(Note note);
  Future updateMeasurements(Note note);
  Future deleteNote(int id);
}
