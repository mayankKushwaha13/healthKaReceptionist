import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/permission.dart';
import 'package:receptionist/screens/print_bill_screen.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class ManageBillsScreen extends StatefulWidget {
  const ManageBillsScreen({super.key});

  @override
  State<ManageBillsScreen> createState() =>
      _ManageBillsScreenState();
}

class _ManageBillsScreenState extends State<ManageBillsScreen> {
  @override
  Widget build(BuildContext context) {
    List data = [];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar(title: "Bills"),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Bills")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      data.clear();
                      final bills =
                          snapshot.data?.docs.reversed.toList();
                      for (var bill in bills!) {
                        data.add(bill);
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
                          for(int i = 0; i <bill["billDetails"].length; i++){
                            billDetails.add(
                              {
                                'service' : bill["billDetails"][i]['service'],
                                'charges' : bill["billDetails"][i]['charges'],
                              }
                            );
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
                                  total: bill["total"], 
                                  doctorID: bill["doctorID"], 
                                  patName: bill["patName"], 
                                  patAge: bill["patAge"], 
                                  patGender: bill["patGender"], 
                                  patPhone: bill["patPhone"], 
                                  date: bill["date"].toString(), 
                                  time: bill["time"], 
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
