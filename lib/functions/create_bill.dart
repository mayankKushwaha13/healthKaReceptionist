import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receptionist/constants/API/receptionist.dart';
import 'package:receptionist/data/shared_preferences.dart';

String invoiceGenerator({
  required int age,
  required String phone,
}) {
  Random random = Random();
  int randomNumber = random.nextInt(9000) + 1000;

  return "$age${phone.substring(0, 2)}$randomNumber";
}

createBillsAPI({
  required BuildContext context,
  required String gender,
  required String phone,
  required String name,
  required String patID,
  required String docID,
  required String billDate,
  required String billTime,
  required int age,
  required List<dynamic> services,
}) async {
  var response = await http.post(
      Uri.parse("$recepAPI/create_appointment_bill_mobile"),
      headers: {'Content': 'application/json', 'Accept': 'application/json'},
      body: jsonEncode({
        "clinic_id": SP.sp!.getString(SP.clinicID),
        "invoice": invoiceGenerator(age: age, phone: phone),
        "gender": gender,
        "patient_phone_number": phone,
        "patient_name": name,
        "patient_id": patID,
        "doctor_id": docID,
        "bill_date": billDate,
        "bill_time": billTime,
        "age": age,
        "services": services,
      }));

  if (response.statusCode == 200) {
    print(jsonDecode(response.body)['message']);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Bill Created")));
  }
}
