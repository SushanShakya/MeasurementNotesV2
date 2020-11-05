import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:MeasurementNotesV2/Storage/iDatabase.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper implements IDb {
  static DbHelper _helper;

  DbHelper._();

  factory DbHelper() {
    if (_helper == null) _helper = DbHelper._();
    return _helper;
  }

  Database db;

  final String dbName = "Note.db";
  final int version = 1;
  final String table = "Notes";

  @override
  open() async {
    db = await openDatabase(join(await getDatabasesPath(), dbName),
        version: version, onCreate: _onCreate);
  }

  _onCreate(Database database, int version) {
    database.execute('''
          CREATE TABLE $table(
            id INTEGER PRIMARY KEY AUTOINCREMENT ,
            length TEXT ,
            chest TEXT ,
            waist TEXT ,
            hip TEXT ,
            sholder TEXT ,
            chirne TEXT ,
            pher TEXT ,
            baulaLength TEXT ,
            baulaBreath TEXT ,
            surwalLength TEXT ,
            surwalBreath TEXT ,
            surwalKnee TEXT ,
            surwalDesign TEXT ,
            neckFront TEXT ,
            neckBack TEXT ,
            frontNeck TEXT ,
            backNeck TEXT ,
            name TEXT ,
            phone TEXT ,
            address TEXT ,
            image TEXT
          );
        ''');
  }

  @override
  Future deleteNote(int id) =>
      db.delete(table, where: "id = ?", whereArgs: [id]);

  @override
  Future<List<Map<String, dynamic>>> fetchCustomerMeasurements() =>
      db.query(table);

  @override
  Future insertNote(Note note) => db.insert(table, note.toMap());

  @override
  Future updateMeasurements(Note note) =>
      db.update(table, note.toMap(), where: "id = ?", whereArgs: [note.id]);
}
