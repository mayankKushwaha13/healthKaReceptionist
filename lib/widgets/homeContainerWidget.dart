import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key, required this.title, required this.icon, required this.page, this.color = MyColors.Burgundy
  });
  final String title;
  final String icon;
  final Widget page;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 200,
      width: (MediaQuery.of(context).size.width - 80) / 2,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(-4, 4),
              color: Colors.grey.shade600,
            )
          ]),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){
          Get.to(()=>page, transition: Transition.rightToLeft);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("lib/assets/${icon}.png",height: 100,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: MyColors.Seashell,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
