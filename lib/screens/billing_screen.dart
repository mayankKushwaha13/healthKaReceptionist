import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/screens/print_bill.dart';
import 'package:receptionist/widgets/appDrawerWidget.dart';
import 'package:receptionist/widgets/billServiceFieldWidget.dart';
import 'package:receptionist/widgets/customWidgets.dart';

class BillingScreen extends StatefulWidget {
  final String patName;
  final String patAge;
  final String patGender;
  final String patPhone;
  final String date;
  final String time;
  final String docID;

  const BillingScreen(
      {super.key,
      required this.patName,
      required this.patAge,
      required this.patGender,
      required this.patPhone,
      required this.date,
      required this.time,
      required this.docID});

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _serviceTypeControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _chargesControllers = [
    TextEditingController()
  ];
  final List<Map<String, String>> _billDetails = [];

  @override
  void dispose() {
    for (var controller in _serviceTypeControllers) {
      controller.dispose();
    }
    for (var controller in _chargesControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addServiceField() {
    setState(() {
      _serviceTypeControllers.add(TextEditingController());
      _chargesControllers.add(TextEditingController());
    });
  }

  void _removeServiceField(int index) {
    if (_serviceTypeControllers.length > 1) {
      setState(() {
        _serviceTypeControllers[index].dispose();
        _chargesControllers[index].dispose();
        _serviceTypeControllers.removeAt(index);
        _chargesControllers.removeAt(index);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('At least one service must be present.')),
      );
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var storage = await Permission.storage.request();
      if (storage.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await permission.isGranted) {
        return true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  void _printBill() async {
    if (_formKey.currentState!.validate()) {
      _billDetails.clear();
      double total = 0;
      for (int i = 0; i < _serviceTypeControllers.length; i++) {
        double charge = double.tryParse(_chargesControllers[i].text) ?? 0;
        total += charge;
        _billDetails.add({
          'service': _serviceTypeControllers[i].text,
          'charges': _chargesControllers[i].text,
        });
      }
      await requestPermission(Permission.storage);
      createBill(
          total: total,
          doctorID: widget.docID,
          date: widget.date,
          patAge: widget.patAge,
          patGender: widget.patGender,
          patName: widget.patName,
          patPhone: widget.patPhone,
          time: widget.time,
          billDetails: _billDetails
      );
    }
  }

  // _showBillDialog (double total) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return BillDialog(billDetails: _billDetails, total: total);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar(title: "Billing Screen"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: MyColors.Seashell,
                    border: Border.all(
                      color: MyColors.Navy,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            const Text(
                              'Please Enter:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MyColors.Navy,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ..._buildServiceFields(),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _addServiceField,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.Rosewood,
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text('Add Service',
                              style: TextStyle(color: MyColors.Seashell)),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _printBill,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.Rosewood,
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text('Continue',
                              style: TextStyle(color: MyColors.Seashell)),
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
    );
  }

  List<Widget> _buildServiceFields() {
    List<Widget> fields = [];
    for (int i = 0; i < _serviceTypeControllers.length; i++) {
      fields.add(ServiceField(
        serviceTypeController: _serviceTypeControllers[i],
        chargesController: _chargesControllers[i],
        onRemove: () => _removeServiceField(i),
      ));
      fields.add(const SizedBox(height: 20));
    }
    return fields;
  }
}
