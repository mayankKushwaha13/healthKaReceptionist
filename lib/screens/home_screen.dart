import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/functions/get_doctors.dart';
import 'package:receptionist/screens/create_appointment_screen.dart';
import 'package:receptionist/screens/doctor_list_screen.dart';
import 'package:receptionist/screens/manage_bills_screen.dart';
import 'package:receptionist/screens/saved_appointments_screen.dart';
import 'package:receptionist/widgets/appDrawerWidget.dart';
import 'package:receptionist/widgets/customWidgets.dart';
import 'package:receptionist/widgets/homeContainerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int carouselIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        backgroundColor: MyColors.Seashell,
        body: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Column(
            children: [
              const MyAppBar(title: "Home"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: GoogleFonts.aBeeZee(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: MyColors.DarkSienna,
                            ),
                            children: [
                              const TextSpan(text: "Hi, "),
                              TextSpan(
                                text: "Receptionist's Name",
                                style: GoogleFonts.aBeeZee(
                                  color: MyColors.Indigo,
                                ),
                              ),
                              const TextSpan(text: "!")
                            ])),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.Navy,
                      ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.josefinSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: MyColors.Gold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 20,
                  color: MyColors.FadedBlue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HomeContainer(
                              title: "Create\nAppointments",
                              icon: "appointment",
                              page: CreateAppointmentScreen(),
                              color: MyColors.Navy,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            HomeContainer(
                              title: "Manage\nBills",
                              icon: "bill",
                              page: ManageBillsScreen(
                                
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HomeContainer(
                                title: "Doctor's\nPatients",
                                icon: "list",
                                page: DoctorsListPage())
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.Rosewood,
                      ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Doctors",
                    style: GoogleFonts.josefinSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: MyColors.Gold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              FutureBuilder(
                future: getDoctors(),
                builder: (context, snapshot) {
                  if(doctors.isNotEmpty){
                  return CarouselSlider(
                    items: doctors.map((e)=>
                      Ink(
                        width: 200,
                        decoration: BoxDecoration(
                          color: MyColors.FadedBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: (){
                            Get.to(
                              ()=>SavedAppointmentsScreen(doctorID: e.doctorId)
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Image.asset(e.image,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(e.firstName,
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.DarkSienna,
                                ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ).toList(),
                    options: CarouselOptions(
                      aspectRatio: 1.628,
                      viewportFraction: 0.5,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          carouselIndex = index;
                        });
                      },
                    ),
                  );}
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0; i < doctors.length;i++)
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: i == carouselIndex ? 10 : 7, 
                      width: i == carouselIndex ? 10 :7,
                      decoration: BoxDecoration(
                        color: i == carouselIndex ? MyColors.Rosewood:MyColors.Red ,
                        shape: BoxShape.circle,
                      ),
              
                    )
                ],
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
