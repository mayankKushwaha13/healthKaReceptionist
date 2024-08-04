
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:receptionist/constants/API/receptionist.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/permission.dart';
import 'package:receptionist/data/bill_database.dart';
import 'package:receptionist/models/bill.dart';
import 'package:receptionist/screens/print_bill_screen.dart';
import 'package:receptionist/widgets/customWidgets.dart';
import 'package:http/http.dart' as http;

class ManageBillsScreen extends StatefulWidget {
  const ManageBillsScreen({super.key});

  @override
  State<ManageBillsScreen> createState() =>
      _ManageBillsScreenState();
}

class _ManageBillsScreenState extends State<ManageBillsScreen> {
  getSingleBill(Bill bill) async {
    var response = await http.post(
      Uri.parse("$recepAPI/single_bill_data_mobile"),
      headers: {
        'Content-type' : 'application/json',
        'Accept' : 'application/json'
      },
      body: jsonEncode({
        'doctor_id' : bill.doctorID,
        'clinic_id' : bill.clinicID,
        'invoice' : bill.invoice
      })
    );
    var result = jsonDecode(response.body)['data'];
    result.add(jsonDecode(response.body)['doctor_data']);
    return result;
  }
  @override
  Widget build(BuildContext context) {
    List data = [];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar(title: "Bills"),
              FutureBuilder(
                  future: BillDatabase().readBillData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      data.clear();
                      final bills =
                          snapshot.data!;
                      for (var bill in bills) {
                        var singleBill = getSingleBill(bill);
                        data.add(singleBill);
                      }
                    }
                    if (data.isEmpty) {
                      return const Center(
                        child: Text("No Bills"),
                      );
                    }
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var bill = data[index];
                          List<Map<String, String>> billDetails = [];
                          double total = 0;
                          for(int i = 0; i <bill["services"].length; i++){
                            billDetails.add(
                              {
                                'service' : bill["services"][i]['service'],
                                'charges' : bill["services"][i]['charges'],
                              }
                            );
                            total += bill['services'][i]['charges'];
                          }
                          return Card(
                            margin: const EdgeInsets.all(7),
                            // color: MyColors.FadedBlue,
                            color: Colors.indigo.shade100,
                            elevation: 5,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () async {
                                await requestPermission(Permission.storage);
                                createBill(
                                  total: total, 
                                  doctorID: bill["doctor_id"], 
                                  patName: bill["patient_name"], 
                                  patAge: bill["age"].toString(), 
                                  patGender: bill["gender"], 
                                  patPhone: bill["patient_phone_number"], 
                                  date: bill["bill_date"].toString(), 
                                  time: bill["bill_time"], 
                                  billDetails: billDetails,
                                );
                              },
                              splashColor: Colors.green.shade50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Patient : " + bill["patName"],
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.DarkSienna,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Date : ",
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.DarkSienna,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          
                                          Text(
                                            bill["date"],
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.Burgundy,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Time : ",
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.DarkSienna,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            bill["time"],
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.Burgundy,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Amount : ",
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.DarkSienna,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            bill["total"].toString(),
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.Burgundy,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RichText(
                                                  text: TextSpan(
                                                      style: GoogleFonts.roboto(
                                                        color:
                                                            MyColors.DarkSienna,
                                                      ),
                                                      children: [
                                                    TextSpan(
                                                        text: "Phone Number : ",
                                                        style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        )),
                                                    TextSpan(
                                                        text: bill["patPhone"])
                                                  ])),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
