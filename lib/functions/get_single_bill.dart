import 'dart:convert';

import 'package:receptionist/data/bill_database.dart';

import '../constants/API/receptionist.dart';
import 'package:http/http.dart' as http;

import '../models/bill.dart';

var singleBill;
List<dynamic> data = [];
getSingleBill(Bill bill) async {
  var response = await http.post(Uri.parse("$recepAPI/single_bill_data_mobile"),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        'doctor_id': bill.doctorID,
        'clinic_id': bill.clinicID,
        'invoice': bill.invoice
      }));
  var body = jsonDecode(response.body);
  List<dynamic> result = body["data"];
  result.add(body['doctor_data']);
  return result;
}

assignSingleBill() async {
  final bills = await BillDatabase().readBillData();
  data.clear();
  for (var bill in bills) {
    singleBill = await getSingleBill(bill);
    data.add(singleBill);
  }
  return data;
}
