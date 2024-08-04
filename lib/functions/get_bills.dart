import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receptionist/constants/API/receptionist.dart';
import 'package:receptionist/data/bill_database.dart';
import 'package:receptionist/data/shared_preferences.dart';
import 'package:receptionist/models/bill.dart';

List<Bill> bills = [];
getBills() async {
  bills = await BillDatabase().readBillData();
  var response = await http.post(
      Uri.parse("$recepAPI/get_all_clinic_bills_mobile"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(
          {'clinic_id': SP.sp!.getString(SP.clinicID)}));
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body)['data'];
    for (int i = 0; i < result.length; i++) {
    var b = result[i];
      int found = bills
          .indexWhere((e) => e.id == b['_id']);
      if (found == -1) {
         Bill bill = Bill(
          billDate: b['bill_date'],
          appointmentID: b['appointment_id'].toString(),
          billTime: b['bill_time'],
          clinicID: SP.sp!.getString(SP.clinicID)!,
          doctorID: b['doctor_id'],
          id: b['_id'],
          invoice: b['invoice'],
          patientName: b['patient_name'],
          phoneNumber: b['patient_phone_number']
         );
        BillDatabase().insertData(bill);
      }
    }
  } else {
    print(response.statusCode);
  }
}
