import 'package:flutter/material.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/widgets/appDrawerWidget.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class ReceptionistProfilePage extends StatelessWidget {
  const ReceptionistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: MyColors.Seashell,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyAppBar(title: "Receptionist Profile"),
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: MyColors.Navy,
                  child: Icon(Icons.person, size: 80, color: MyColors.Seashell),
                ),
                const SizedBox(height: 20),
                const Text(
                  'MR ABC',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: MyColors.DarkSienna,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Color.fromARGB(255, 219, 233, 242),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.Indigo,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Receptionist',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyColors.Indigo,
                              ),
                            ),
                          ),
                          Divider(color: MyColors.Navy2), // Divider for separation
                          ListTile(
                            leading: Icon(Icons.cake, color: MyColors.Indigo, size: 30,),
                            title: Text(
                              'Age',
                              style: TextStyle(color: MyColors.RedDark, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '30',
                              style: TextStyle(color: MyColors.DarkSienna),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.wc, color: MyColors.Indigo),
                            title: Text(
                              'Gender',
                              style: TextStyle(color: MyColors.RedDark, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Male',
                              style: TextStyle(color: MyColors.DarkSienna),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: Icon(Icons.phone, color: MyColors.Indigo),
                                  title: Text(
                                    'Phone',
                                    style: TextStyle(color: MyColors.RedDark, fontWeight: FontWeight.bold,fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    '1234567890',
                                    style: TextStyle(color: MyColors.DarkSienna),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}