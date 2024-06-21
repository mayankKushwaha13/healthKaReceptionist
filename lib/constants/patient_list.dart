import 'package:receptionist/models/patient.dart';

class patientList {
  patientList._();
  static List<Patient> patients = [
    Patient(name: 'kjasdlkja', phoneNumber: '123456789', firstVisitDate: '01-01-2024', gender: 'Male',icon: "lib/assets/boy.png",type: "Follow Up"),
    Patient(name: 'aljdflka', phoneNumber: '123456789', firstVisitDate: '01-01-2024', gender: 'Male',icon: "lib/assets/patient.png",),
    Patient(name: 'hi', phoneNumber: '123456789', firstVisitDate: '01-01-2024', gender: 'Male',icon: "lib/assets/boy.png",),
    Patient(name: 'oh no', phoneNumber: '123456789', firstVisitDate: '01-01-2024', gender: 'Male',icon: "lib/assets/patient.png",type: "Follow Up"),
    Patient(name: 'mayank', phoneNumber: '123456789', firstVisitDate: '01-01-2024', gender: 'Male',icon: "lib/assets/patient.png",),
    Patient(name: 'hasilkalkdfl', phoneNumber: '123456789', firstVisitDate: '01-01-2024', gender: 'Male',icon: "lib/assets/patient.png",),
  ];
}