import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/API/receptionist.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/data/doctor_database.dart';
import 'package:receptionist/functions/get_receptionist.dart';
import 'package:receptionist/models/doctor.dart';
import 'package:receptionist/screens/home_screen.dart';
import 'package:receptionist/widgets/customWidgets.dart';

import '../data/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();

  final password = TextEditingController();
  bool isLogging = false;
  bool apiCalled = false;

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
                        onTap: isLogging? (){

                        } : () async {
                          if(username.text.isEmpty || password.text.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(
                              (const SnackBar(content: Text("Enter Credentials")))
                            );
                            return;
                          }
                          var response = await login(
                              username: username.text, password: password.text);
                          if ((response != null &&
                                  (response.statusCode.toString()[0] == "2" ||
                                      response.statusCode == 200) && (jsonDecode(response.body)['resSuccess'].toString() == "1"))) {
                            SP.sp!.setBool(SP.login, true);
                            SP.sp!.setString(SP.recID, username.text);
                            if (apiCalled) {
                              final result = jsonDecode(response.body);
                              var docList = await DoctorDatabase().readDoctorData();
                              var docData = result['doctorData'];
                              for (int i = 0; i < docData.length; i++){
                                int found = docList.indexWhere((e)=>e.doctorId == docData[i]['doctor_id']);
                                if (found == -1){
                                  Doctor doctor = Doctor.fromMap(docData[i]);
                                  DoctorDatabase().insertData(doctor);
                                }
                              }
                              var clinicID = result['clinic_id'];
                              SP.sp!.setString(SP.clinicID, clinicID);
                            }
                            setState(() {
                              isLogging = true;
                            });
                            getReceptionist(username.text);
                            Future.delayed(const Duration(milliseconds: 1500),
                                () {
                              setState(() {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                                isLogging = false;
                              });
                            });
                          }else if(response.statusCode == 200){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Invalid credentials"),
                            ));
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Something Went Wrong"),
                            ));
                          }
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: isLogging? const Center(
                              child: CircularProgressIndicator(color: Colors.white,),
                            ):Text(
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
  login({required String username, required String password}) async {
    try {
        apiCalled = true;
        Map<String, dynamic> body = {
          "receptionist_id": username,
          "password": password
        };
        String jsonBody = jsonEncode(body);
        var response = await http.post(
          Uri.parse("$recepAPI/login_mobile"),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonBody,
        );
        print(response.statusCode);
        return response;
    } catch (e) {
      print(e);
    }
  }

}
