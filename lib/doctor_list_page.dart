import 'package:doctor_records/navigation.dart';
import 'package:flutter/material.dart';
import 'package:doctor_records/asset/constants/colors.dart';
import 'package:doctor_records/asset/constants/doctor_class.dart';


class DoctorsListPage extends StatelessWidget {
  const DoctorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: const AppDrawer(),
      backgroundColor: MyColors.Seashell,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: MyColors.Navy,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Record List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Card(
                    color: MyColors.Peach,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: MyColors.Navy, width: 2),
                    ),
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 40,
                            color: MyColors.Navy,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${doctor.firstName} ${doctor.lastName}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.DarkSienna,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Doctor ID: ${doctor.doctorId}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: MyColors.DarkSienna,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Specialisation: ${doctor.specialisation}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: MyColors.DarkSienna,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Phone: ${doctor.phoneNumber}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: MyColors.DarkSienna,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
