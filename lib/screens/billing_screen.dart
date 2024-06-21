import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final service = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.Seashell,
        body: Column(
          children: [
            MyAppBar(title: "Billing"), 
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row( 
                children: [
                  Text("Service Name : ",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: MyColors.DarkSienna,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(width: 10,),
                  Flexible(
                    child: TextField(
                      controller: service,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: MyColors.white,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: MyColors.Burgundy,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row( 
                children: [
                  Text("Charges : ",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: MyColors.DarkSienna,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(width: 10,),
                  Flexible(
                    child: TextField(
                      controller: service,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: MyColors.white,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: MyColors.Burgundy,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Ink(
                decoration: BoxDecoration(
                  color: MyColors.Navy,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Print",
                      style: GoogleFonts.aBeeZee(
                        color: MyColors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}