import 'package:path/path.dart';
import 'package:receptionist/models/bill.dart';
import 'package:sqflite/sqflite.dart';

class BillDatabase {
  static Database? _billDB;

  Future<Database?> get billDatabase async {
    if (_billDB != null) {
      return _billDB;
    }

    String path = join(await getDatabasesPath(), 'billDatabase.db');
    _billDB =
        await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE bills(
          id TEXT,
          BillID TEXT,
          billDate TEXT,
          billTime TEXT,
          invoice TEXT,
          phoneNumber TEXT,
          patientName TEXT,
          doctorID TEXT,
          clinicID TEXT
          )
          ''');
    });
    return _billDB;
  }

  insertData(Bill bill) async {
    Database? db = await billDatabase;
    db!.insert('bills', bill.toTable());
  }

  Future<List<Bill>> readBillData() async {
    Database? db = await billDatabase;
    final list = await db!.query('bills');
    return list.map((map) => Bill.fromTable(map)).toList();
  }

  // void alterTable() async {
  //   Database? db = await billDatabase;
  //   await db!.execute("ALTER TABLE bills ADD appointmentID TEXT");
  // }
}
