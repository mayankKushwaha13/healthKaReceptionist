import 'package:path/path.dart';
import 'package:receptionist/models/doctor.dart';
import 'package:sqflite/sqflite.dart';

class DoctorDatabase {
  static Database? _doctorDB;

  Future<Database?> get doctorDatabase async {
    if (_doctorDB != null) {
      return _doctorDB;
    }

    String path = join(await getDatabasesPath(), 'doctorDatabase.db');
    _doctorDB =
        await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE doctors(
          firstName TEXT,
          lastName TEXT,
          doctorID TEXT,
          specialization TEXT
          )
          ''');
    });
    return _doctorDB;
  }

  insertData(Doctor doctor) async {
    Database? db = await doctorDatabase;
    db!.insert('doctors', doctor.toTable());
  }

  Future<List<Doctor>> readDoctorData() async {
    Database? db = await doctorDatabase;
    final list = await db!.query('doctors');
    return list.map((map) => Doctor.fromTable(map)).toList();
  }

  // Future updateData(
  //     {
  //     required String patientID,
  //     required Map<String, Object?> data}) async {
  //   Database? db = await doctorDatabase;
  //   await db!.update(
  //     'doctors',
  //     data,
  //     where: 'patientID = ?',
  //     whereArgs: [patientID],
  //   );
  // }
}