import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receptionist/constants/API/receptionist.dart';

createAppointments({
  required BuildContext context,
  required String patientID,
  required String patientName,
  required String phoneNumber,
  required String age,
  required String gender,
  required String appointmentType,
  required String appointmentDate,
  required String appointmentTime,
  required String doctorID,
  required String clinicID,
  required String receptionistID,
}) async {
  var response = await http.post(
      Uri.parse("$recepAPI/create_new_appointment_mobile"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        "patient_id": patientID,
        "phone_number": phoneNumber,
        "gender": gender,
        "age": int.parse(age),
        "doctor_id": doctorID,
        "appointment_time": appointmentTime,
        "receptionist_id": receptionistID,
        "clinic_id": clinicID,
        "appointment_type": appointmentType,
        "appointment_date": appointmentDate,
        "patient_name": patientName
      }));

  if(response.statusCode == 200){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Appointment Saved")
      )
    );
    print(response.body);
  }
  else{
    print(response.statusCode);
  }
}
