import 'package:receptionist/data/doctor_database.dart';

import '../models/doctor.dart';
List<Doctor> doctors = [];
void getDoctors() async {
  doctors = await DoctorDatabase().readDoctorData();
  final ids = doctors.map((e) => e.doctorId).toSet();
doctors.retainWhere((x) => ids.remove(x.doctorId));

}