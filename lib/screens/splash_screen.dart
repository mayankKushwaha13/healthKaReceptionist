import 'package:flutter/material.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/screens/home_screen.dart';
import 'package:receptionist/screens/login_screen.dart';

import 'dart:async';

import 'package:receptionist/widgets/customWidgets.dart';

import '../data/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.Peach, // Set your background color here
        body: Stack(
          alignment: Alignment.center,
          children: [
            CircularDesign(radius: 400, opacity: 0.45, x: -width/2, y: -height/2,),
                CircularDesign(radius: 360, opacity: 0.4, x: width/2, y: height/2,),
                CircularDesign(radius: 200, opacity: 0.25, y: height/2,),
                CircularDesign(radius: 200, opacity: 0.25, y: -height/2,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Image.asset('lib/assets/healthka.png',width: 260,),
                const SizedBox(height: 20,),
                Image.asset('lib/assets/loading.gif', height: 100,),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void checkLogin()async{
    bool? isLoggedIn = SP.sp!.getBool(SP.login);

    Timer(const Duration(milliseconds: 3550), () {
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen()));
        }
        else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen()));
        }
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen()));
      }
    });
  }

}