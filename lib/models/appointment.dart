import 'package:receptionist/data/shared_preferences.dart';

class Appointment {
  final String appointmentType;
  final String appointmentTime;
  final String appointmentDate;
  final String appointmentID;
  final String patientID;
  final String patientName;
  final String age;
  final String gender;
  final String doctorID;
  final String clinicID;

  Appointment(
      {required this.appointmentType,
      required this.appointmentTime,
      required this.appointmentDate,
      required this.appointmentID,
      required this.patientID,
      required this.patientName,
      required this.age,
      required this.clinicID,
      required this.doctorID,
      required this.gender});

  factory Appointment.fromTable(Map<String, dynamic> map) {
    return Appointment(
      age: map['age'],
      appointmentID: map['appointmentID'],
      appointmentDate: map['appointmentDate'],
      appointmentTime: map['appointmentTime'],
      appointmentType: map['appointmentType'],
      gender: map['gender'],
      patientID: map['patientID'],
      patientName: map['patientName'],
      clinicID: SP.sp!.getString(SP.clinicID)!,
      doctorID: map['doctorID'],
    );
  }

  // factory Appointment.fromMap(Map<String, dynamic> map) {
  //   return Appointment(
  //     age: map['age'].toString(),
  //     appointmentID: map['appointment_id'],
  //     appointmentDate: map['appointment_date'],
  //     appointmentTime: map['appointment_time'],
  //     appointmentType: map['appointment_type'],
  //     gender: map['gender'],
  //     patientID: map['patient_id'],
  //     patientName: map['patient_name'],
  //     clinicID: 
  //   );
  // }

  Map<String, dynamic> toTable() {
    return {
      "age" : age,
      "appointmentID" : appointmentID,
      "appointmentDate" : appointmentDate,
      "appointmentType" : appointmentType,
      "appointmentTime" : appointmentTime,
      "gender" : gender,
      "patientID" : patientID,
      "patientName" : patientName,
      "doctorID" : doctorID,
      "clinicID" : clinicID,
    };
  }
}
