import 'package:path/path.dart';
import 'package:receptionist/models/appointment.dart';
import 'package:sqflite/sqflite.dart';

class AppointmentDatabase {
  static Database? _appointmentDB;

  Future<Database?> get appointmentDatabase async {
    if (_appointmentDB != null) {
      return _appointmentDB;
    }

    String path = join(await getDatabasesPath(), 'appointmentDatabase.db');
    _appointmentDB =
        await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE appointments(
          age TEXT,
          appointmentID TEXT,
          appointmentDate TEXT,
          appointmentType TEXT,
          appointmentTime TEXT,
          gender TEXT,
          patientID TEXT,
          patientName TEXT,
          doctorID TEXT,
          clinicID TEXT
          )
          ''');
    });
    return _appointmentDB;
  }

  insertData(Appointment appointment) async {
    Database? db = await appointmentDatabase;
    db!.insert('appointments', appointment.toTable());
  }

  Future<List<Appointment>> readAppointmentData() async {
    Database? db = await appointmentDatabase;
    final list = await db!.query('appointments');
    return list.map((map) => Appointment.fromTable(map)).toList();
  }

  void alterTable() async {
    Database? db = await appointmentDatabase;
    await db!.execute("ALTER TABLE appointments ADD clinicID TEXT");
  }
}
