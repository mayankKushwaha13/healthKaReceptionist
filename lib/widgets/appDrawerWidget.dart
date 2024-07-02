import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/screens/home_screen.dart';
import 'package:receptionist/screens/receptionist_profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.Seashell,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: MyColors.BackgroundHealthka,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 80, right: 20, left: 20, bottom: 40),
              child: Image.asset("lib/assets/healthka.png"),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            color: MyColors.MillenialPink,
            child: ListTile(
              leading: const Icon(
                Icons.home,
                color: MyColors.DarkSienna,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                    color: MyColors.Burgundy, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: 
                  (context)=>const HomeScreen()),(route)=>route.isCurrent
                  );
              },
            ),
          ),
          // SizedBox(height: 10,),
          // Container(
          //   color: MyColors.MillenialPink,
          //   child: ListTile(
          //     leading: const Icon(
          //       Icons.receipt,
          //       color: MyColors.DarkSienna,
          //     ),
          //     title: Text(
          //       'Generate Bill',
          //       style: GoogleFonts.aBeeZee(
          //         fontSize: 18,
          //           color: MyColors.Burgundy, fontWeight: FontWeight.bold),
          //     ),
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const BillingScreen()),
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(height: 10,),
          Container(
            color: MyColors.MillenialPink,
            child: ListTile(
              leading: const Icon(Icons.person, color: MyColors.DarkSienna,),
              title: Text('Receptionist',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                      color: MyColors.Burgundy, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReceptionistProfilePage()),
                );
              },
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            color: MyColors.MillenialPink,
            child: ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: MyColors.Burgundy,
              ),
              title: Text(
                "Logout",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyColors.DarkSienna
                ),
              ),
              onTap: (){},
            ),
          )
        ],
      ),
    );
  }
}
