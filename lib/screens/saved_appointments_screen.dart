import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class SavedAppointmentsScreen extends StatefulWidget {
  final String doctorID;
  const SavedAppointmentsScreen({super.key, required this.doctorID});

  @override
  State<SavedAppointmentsScreen> createState() =>
      _SavedAppointmentsScreenState();
}

class _SavedAppointmentsScreenState extends State<SavedAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    List data = [];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar(title: "Appointments"),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Appointments")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      data.clear();
                      final appointments =
                          snapshot.data?.docs.reversed.toList();
                      for (var appointment in appointments!) {
                        if (appointment['doctor'] == widget.doctorID) {
                          data.add(appointment);
                        }
                      }
                    }
                    if (data.isEmpty) {
                      return const Center(
                        child: Text("No Appointments"),
                      );
                    }
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var docApt = data[index];
                          bool today = docApt["aptDate"] ==
                              ("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
                          return Card(
                            margin: const EdgeInsets.all(7),
                            color: MyColors.FadedBlue,
                            elevation: 5,
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
                                          "Patient : " + docApt["patientName"],
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
                                          "Appointment Date : ",
                                          style: GoogleFonts.aBeeZee(
                                            color: MyColors.DarkSienna,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        today
                                            ? Text(
                                                "(Today)",
                                                style: GoogleFonts.aBeeZee(
                                                  color: MyColors.RedDark,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            : Container(),
                                        Text(
                                          docApt["aptDate"],
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
                                          "Appointment Time : ",
                                          style: GoogleFonts.aBeeZee(
                                            color: MyColors.DarkSienna,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          docApt["aptTime"],
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
                                          "Appointment Type : ",
                                          style: GoogleFonts.aBeeZee(
                                            color: MyColors.DarkSienna,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          docApt["aptType"],
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
                                                      text: docApt["phoneNum"])
                                                ])),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
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
