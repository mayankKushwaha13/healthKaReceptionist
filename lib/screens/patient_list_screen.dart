import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/patient_list.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class PatientListScreen extends StatefulWidget {
  final String name;
  const PatientListScreen({super.key, required this.name});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.Seashell,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                title: "${widget.name}'s\nPatients",
                size: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: patients.length,
                        itemBuilder: (context, index) {
                          final patient = patients[index];
                          return Card(
                            color: MyColors.Navy,
                            margin: const EdgeInsets.symmetric(vertical: 7),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    patient.icon,
                                    height: 80,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.Seashell,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: patient.name,
                                                  style: GoogleFonts.aBeeZee(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.Gold,
                                                  )),
                                            ]),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.Seashell,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: "Gender : ",
                                                  style: GoogleFonts.aBeeZee(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.LightPink,
                                                  )),
                                              TextSpan(
                                                text: patient.gender,
                                              )
                                            ]),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            style: GoogleFonts.aBeeZee(
                                              color: MyColors.Seashell,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              TextSpan(
                                                  text: "Phone : ",
                                                  style: GoogleFonts.aBeeZee(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.LightPink,
                                                  )),
                                              TextSpan(
                                                text: patient.phoneNumber,
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
