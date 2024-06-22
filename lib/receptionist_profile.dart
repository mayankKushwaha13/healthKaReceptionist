import 'package:flutter/material.dart';
import 'package:doctor_records/asset/constants/colors.dart';

class ReceptionistProfilePage extends StatelessWidget {
  const ReceptionistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Receptionist Profile',
          style: TextStyle(color: MyColors.Seashell),
        ),
        backgroundColor: MyColors.Navy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: MyColors.Seashell,
                    border: Border.all(
                      color: MyColors.Navy,
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
                            color: MyColors.DarkSienna,
                          ),
                        ),
                      ),
                      Divider(color: MyColors.Navy), // Divider for separation
                      ListTile(
                        leading: Icon(Icons.cake, color: MyColors.Navy),
                        title: Text(
                          'Age',
                          style: TextStyle(color: MyColors.Navy),
                        ),
                        subtitle: Text(
                          '30',
                          style: TextStyle(color: MyColors.DarkSienna),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.wc, color: MyColors.Navy),
                        title: Text(
                          'Gender',
                          style: TextStyle(color: MyColors.Navy),
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
                              leading: Icon(Icons.phone, color: MyColors.Navy),
                              title: Text(
                                'Phone',
                                style: TextStyle(color: MyColors.Navy),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
