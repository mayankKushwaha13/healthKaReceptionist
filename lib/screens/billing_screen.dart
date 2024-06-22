import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/doctor_list.dart';
import 'package:receptionist/screens/print_bill_screen.dart';
import 'package:receptionist/widgets/appDrawerWidget.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class BillingScreen extends StatefulWidget {
  final String patName;
  final String patAge;
  final String patGender;
  final String patPhone;
  final String date;
  final String time;
  final String docID;
  const BillingScreen({super.key, required this.patName, required this.patAge, required this.patGender, required this.patPhone, required this.date, required this.time, required this.docID});

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _chargesController = TextEditingController();
  final List<String> serviceType =[];
  final List<String> charges = [];

  @override
  void dispose() {
    _serviceTypeController.dispose();
    _chargesController.dispose();
    super.dispose();
  }

  void _printBill() {
    if (_formKey.currentState!.validate()) {
      // Implement print functionality here
      print('Service Type: ${_serviceTypeController.text}');
      print('Charges: ${_chargesController.text}');
      serviceType.add(_serviceTypeController.text);
      charges.add(_chargesController.text);
      Get.to(() => PrintBillScreen(
        doctorID: widget.docID,
        date: widget.date,
        patAge: widget.patAge,
        patGender: widget.patGender,
        patName: widget.patName,
        patPhone: widget.patPhone,
        time: widget.time,
        serviceType: serviceType,
        charges: charges,
      ), transition: Transition.fade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        backgroundColor: MyColors.Seashell,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(title: "Billing"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: MyColors.Peach,
                    border: Border.all(
                      color: MyColors.Navy,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Please Enter:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyColors.Navy,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _serviceTypeController,
                            decoration: const InputDecoration(
                              labelText: 'Service Type',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: MyColors.Seashell,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the service type';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _chargesController,
                            decoration: const InputDecoration(
                              labelText: 'Charges',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: MyColors.Seashell,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the charges';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _printBill,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.Rosewood,
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text(
                              'Print',
                              style: TextStyle(color: MyColors.Seashell),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
