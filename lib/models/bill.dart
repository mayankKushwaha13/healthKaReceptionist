import 'package:receptionist/data/shared_preferences.dart';

class Bill {
  final String id;
  final String invoice;
  final String appointmentID;
  final String phoneNumber;
  final String patientName;
  final String doctorID;
  final String clinicID;
  final String billDate;
  final String billTime;

  Bill(
      {required this.id,
      required this.invoice,
      required this.phoneNumber,
      required this.appointmentID,
      required this.patientName,
      required this.clinicID,
      required this.doctorID,
      required this.billDate,
      required this.billTime});

  factory Bill.fromTable(Map<String, dynamic> map) {
    return Bill(
      id: map['id'],
      appointmentID: map['appointmentID'],
      billDate: map['billDate'],
      billTime: map['billTime'],
      invoice: map['invoice'],
      phoneNumber: map['phoneNumber'],
      patientName: map['patientName'],
      clinicID: SP.sp!.getString(SP.clinicID)!,
      doctorID: map['doctorID'],
    );
  }

  Map<String, dynamic> toTable() {
    return {
      "id" : id,
      "billDate" : billDate,
      "billTime" : billTime,
      "invoice" : invoice,
      "appointmentID" : appointmentID,
      "phoneNumber" : phoneNumber,
      "patientName" : patientName,
      "doctorID" : doctorID,
      "clinicID" : clinicID,
    };
  }
}
