import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/doctor_list.dart';

class PrintBillScreen extends StatefulWidget {
  final String doctorID;
  final String patName;
  final String patAge;
  final String patGender;
  final String patPhone;
  final String date;
  final String time;
  final List<String> serviceType;
  final List<String> charges;
  const PrintBillScreen(
      {super.key,
      required this.doctorID,
      required this.serviceType,
      required this.charges, required this.patName, required this.patAge, required this.patGender, required this.patPhone, required this.date, required this.time});

  @override
  State<PrintBillScreen> createState() => _PrintBillScreenState();
}

class _PrintBillScreenState extends State<PrintBillScreen> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
    int index = doctors.indexWhere((e) => e.doctorId == widget.doctorID);
    var doctor = doctors[index];
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.Seashell,
        body: Card(
          margin: EdgeInsets.all(20),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Divider(
                  color: MyColors.DarkSienna,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                text: "Name : ",
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "${doctor.firstName} ${doctor.lastName}",
                              ),
                            ])),
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                text: "Qualification : ",
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: doctor.qualification,
                              ),
                            ])),
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                text: "Specialisation : ",
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: doctor.specialisation,
                              ),
                            ])),
                      ],
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          doctor.image,
                          fit: BoxFit.contain,
                        )),
                  ],
                ),
                Divider(
                  color: MyColors.DarkSienna,
                  thickness: 1,
                ),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    SizedBox(width: double.infinity,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Name : ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.patName,
                                ),
                              ])),
                              RichText(
                              text: TextSpan(
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Phone No. : ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.patPhone,
                                ),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Age : ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.patAge,
                                ),
                              ])),
                              RichText(
                              text: TextSpan(
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Gender : ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.patGender,
                                ),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Date : ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.date,
                                ),
                              ])),
                              RichText(
                              text: TextSpan(
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Time : ",
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.time,
                                ),
                              ])),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  color: MyColors.Navy2,
                  thickness: 1,
                ),
                Center(
                  child: Text(
                    "Bill",
                    style : GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.DarkSienna,
                    )
                  ),
                ),
                Divider(
                  color: MyColors.Navy2,
                  thickness: 2,
                ),
                SizedBox(height: 20,),

                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.charges.length,
                    itemBuilder: (context,index)
                    {
                      final serviceType = widget.serviceType[index];
                      final charges = widget.charges[index];
                      total += double.parse(charges);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            serviceType,
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹ ${charges}",
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      );
                    }
                    ),
                ),
                Divider(
                  color: MyColors.DarkSienna,
                  thickness: 1,
                ),
                StatefulBuilder(
                  builder: (context, innerSetState) {
                    innerSetState(() {
                      total;
                    });
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total : ",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹ ${total}",
                          style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.charges.clear();
    widget.serviceType.clear();
  }
}
