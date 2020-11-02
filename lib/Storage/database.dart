import 'package:MeasurementNotesV2/Constants/table_names.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'newData.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tNote(
            id integer primary key autoincrement,
            deliveryDate text,            
            savedDate text,
            customer_id INTEGER NOT NULL,                        
          );
        ''');

      await db.execute('''
          create table $tUserMeasurement(            
            id INTEGER NOT NULL PRIMARY KEY,            
            length TEXT,
            chest TEXT,
            waist TEXT,
            hip TEXT,
            sholder TEXT,
            chirne TEXT,
            pher TEXT,
            baula_length TEXT,
            baula_breath TEXT,
            surwal_length TEXT,
            surwal_breath TEXT,
            surwal_knee TEXT,
            surwal_design TEXT,
            backNeck_id INTEGER,
            frontNeck_id INTEGER,
            neck_message TEXT
          );
        ''');

      await db.execute("""
        CREATE TABLE $tCustomers (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          message TEXT,
          address TEXT,
          phone TEXT,
          measurement_id INTEGER
        );
      """);

      // await db.execute("""
      //   CREATE TABLE $tNeckDesign (
      //     id INTEGER PRIMARY KEY AUTOINCREMENT,
      //     backNeck_id INTEGER,
      //     frontNeck_id INTEGER,
      //     message TEXT
      //   );
      // """);

      await db.execute("""
        CREATE TABLE $tNeckImages (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          image TEXT NOT NULL UNIQUE
        );
      """);

      // await db.execute("""
      //   CREATE TABLE $tBaula(
      //     id INTEGER PRIMARY KEY AUTOINCREMENT,
      //     length TEXT,
      //     breath TEXT
      //   );
      // """);

      // await db.execute("""
      //   CREATE TABLE $tSurwal(
      //     id INTEGER PRIMARY KEY AUTOINCREMENT,
      //     length TEXT,
      //     breath TEXT,
      //     knee TEXT,
      //     design TEXT
      //   );
      // """);

      // await db.execute("""
      //   CREATE TABLE $tCloth(
      //     id INTEGER PRIMARY KEY AUTOINCREMENT,
      //     length TEXT,
      //     chest TEXT,
      //     waist TEXT,
      //     hip TEXT,
      //     sholder TEXT,
      //     chirne TEXT,
      //     pher TEXT
      //   );
      // """);
    });
  }

  static Future<List<Map<String, dynamic>>> fetchDueWork() => db.rawQuery('''
      SELECT A.deliveryDate, A.savedDate , B.name, B.phone FROM $tNote AS A JOIN $tCustomers AS B ON A.customer_id = B.id
    ''');

  static Future<List<Map<String, dynamic>>> fetchCustomers() =>
      db.query(tCustomers);

  static Future<List<Map<String, dynamic>>> fetchCustomerMeasurements(
          int measurementId) =>
      db.rawQuery("""
        SELECT A.* , B.image AS frontNeck, C.image AS backNeck FROM $tUserMeasurement AS A JOIN $tNeckImages AS B ON A.frontNeck_id = B.id JOIN $tNeckImages AS C ON A.backNeck_id = C.id WHERE A.id = ?;
      """, [measurementId]);

  static Future insertNote(Map<String, dynamic> note) async {
    await db.insert('Notes', note);
  }

  static Future updateNote(Map<String, dynamic> note) async {
    await db.update('Notes', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future deleteNote(int id) async {
    await db.delete('Notes', where: 'id = ?', whereArgs: [id]);
  }
}
