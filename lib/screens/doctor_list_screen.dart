import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/doctor_list.dart';
import 'package:receptionist/screens/patient_list_screen.dart';
import 'package:receptionist/widgets/appDrawerWidget.dart';
import 'package:receptionist/widgets/customWidgets.dart';


class DoctorsListPage extends StatelessWidget {
  const DoctorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        backgroundColor: MyColors.Seashell,
        body: Column(
          children: [
            const MyAppBar(title: "Doctor's Patients"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: MyColors.Navy,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Record List',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>PatientListScreen(name: doctor.firstName), transition: Transition.rightToLeft);
                        },
                        child: Card(
                          color: MyColors.FadedBlue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: MyColors.Navy,
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${doctor.firstName} ${doctor.lastName}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.Burgundy,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.aBeeZee(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.DarkSienna,
                                      ),
                                      children: [TextSpan(
                                        text: "Doctor ID : ",
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.Navy2
                                        )
                                      ),
                                      TextSpan(
                                        text: doctor.doctorId,
                                      )
                                      ]
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.aBeeZee(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.DarkSienna,
                                      ),
                                      children: [TextSpan(
                                        text: "Specialisation : ",
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.Navy2
                                        )
                                      ),
                                      TextSpan(
                                        text: doctor.specialisation,
                                      )
                                      ]
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.aBeeZee(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.DarkSienna,
                                      ),
                                      children: [TextSpan(
                                        text: "Phone : ",
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.Navy2
                                        )
                                      ),
                                      TextSpan(
                                        text: doctor.phoneNumber,
                                      )
                                      ]
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}