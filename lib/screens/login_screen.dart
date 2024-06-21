import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/screens/home_screen.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.Peach,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularDesign(
                radius: 400,
                opacity: 0.45,
                x: -width / 2,
                y: -height / 2,
              ),
              CircularDesign(
                radius: 360,
                opacity: 0.4,
                x: width / 2,
                y: height / 2,
              ),
              CircularDesign(
                radius: 200,
                opacity: 0.25,
                y: height / 2,
              ),
              CircularDesign(
                radius: 200,
                opacity: 0.25,
                y: -height / 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("lib/assets/healthka.png"),
                    height: 80,
                  ),
                  Container(
                    child: Text(
                      "Aap ke health ke liye healthka :)",
                      style: GoogleFonts.dmSans(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyTextField(
                    controller: username,
                    hint: "Enter Username",
                    bold: true,
                    color: MyColors.Navy,
                    textColor: MyColors.Gold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    controller: password,
                    hint: "Enter Password",
                    bold: true,
                    color: MyColors.Navy,
                    textColor: MyColors.Gold,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Ink(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColors.RedDark,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> patientProfileScreen()));
                          Get.to(HomeScreen(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Login",
                              style: GoogleFonts.lato(
                                color: MyColors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
