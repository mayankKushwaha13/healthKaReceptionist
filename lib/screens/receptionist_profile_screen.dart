import 'package:flutter/material.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/data/shared_preferences.dart';
import 'package:receptionist/widgets/appDrawerWidget.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class ReceptionistProfilePage extends StatelessWidget {
  const ReceptionistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        backgroundColor: MyColors.Seashell,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyAppBar(title: "Receptionist Profile"),
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: MyColors.Navy,
                  child: Icon(Icons.person, size: 80, color: MyColors.Seashell),
                ),
                const SizedBox(height: 20),
                Text(
                  SP.sp!.getString(SP.name) ?? "",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: MyColors.DarkSienna,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: const Color.fromARGB(255, 219, 233, 242),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.Indigo,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
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
                          const Divider(color: MyColors.Navy2), // Divider for separation
                          ListTile(
                            leading: const Icon(Icons.cake, color: MyColors.Indigo, size: 30,),
                            title: const Text(
                              'Age',
                              style: TextStyle(color: MyColors.RedDark, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              SP.sp!.getString(SP.age) ?? "",
                              style: const TextStyle(color: MyColors.DarkSienna),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.wc, color: MyColors.Indigo),
                            title: const Text(
                              'Gender',
                              style: TextStyle(color: MyColors.RedDark, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              SP.sp!.getString(SP.gender) ?? "",
                              style: const TextStyle(color: MyColors.DarkSienna),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(Icons.phone, color: MyColors.Indigo),
                                  title: const Text(
                                    'Phone',
                                    style: TextStyle(color: MyColors.RedDark, fontWeight: FontWeight.bold,fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    SP.sp!.getString(SP.phoneNumber) ?? "",
                                    style: const TextStyle(color: MyColors.DarkSienna),
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