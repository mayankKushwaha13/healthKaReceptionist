import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receptionist/constants/API/receptionist.dart';
import 'package:receptionist/data/appointment_database.dart';
import 'package:receptionist/data/shared_preferences.dart';
import 'package:receptionist/models/appointment.dart';

List<Appointment> appointments = [];
getAppointments(String doctorID) async {
  appointments = await AppointmentDatabase().readAppointmentData();
  var response = await http.post(
      Uri.parse("$recepAPI/get_all_appointments_mobile"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(
          {'doctor_id': doctorID, 'clinic_id': SP.sp!.getString(SP.clinicID)}));
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body)['result'];
    for (int i = 0; i < result.length; i++) {
    var appt = result[i];
      int found = appointments
          .indexWhere((e) => e.appointmentID == appt['appointment_id']);
      if (found == -1) {
        Appointment appointment = Appointment(
            appointmentType: appt['appointment_type'] == 0 ? "Check UP" : "Follow Up",
            appointmentTime: appt['appointment_time'],
            appointmentDate: appt['appointment_date'],
            appointmentID: appt['appointment_id'],
            patientID: appt['patient_id'],
            patientName: appt['patient_name'],
            age: appt['age'].toString(),
            clinicID: SP.sp!.getString(SP.clinicID)!,
            doctorID: doctorID,
            gender: appt['gender']);
        AppointmentDatabase().insertData(appointment);
      }
    }
  } else {
    print(response.statusCode);
  }
}
