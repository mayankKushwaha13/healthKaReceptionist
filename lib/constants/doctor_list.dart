import 'package:receptionist/models/doctor.dart';

class DoctorList{
  DoctorList._();
  static List<Doctor> doctors =[
    Doctor(name: "Gayathri", image: "lib/assets/doctor1.png"),
    Doctor(name: "Soumyajit", image: "lib/assets/doctor2.png"),
    Doctor(name: "Mayank", image: "lib/assets/doctor3.png"),
  ];
}