import 'package:doctor_records/bill_service_field.dart';
import 'package:flutter/material.dart';
import 'package:doctor_records/asset/constants/colors.dart';

import 'bill_dialog.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _serviceTypeControllers = [TextEditingController()];
  final List<TextEditingController> _chargesControllers = [TextEditingController()];
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

  void _printBill() {
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
      _showBillDialog(total);
    }
  }

  void _showBillDialog(double total) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BillDialog(billDetails: _billDetails, total: total);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Bill', style: TextStyle(color: MyColors.Seashell)),
        backgroundColor: MyColors.Navy,
      ),
      body: Padding(
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
                Expanded(
                  child: ListView(
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
                ),
                ElevatedButton(
                  onPressed: _addServiceField,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.Rosewood,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Add Service', style: TextStyle(color: MyColors.Seashell)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _printBill,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.Rosewood,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Print', style: TextStyle(color: MyColors.Seashell)),
                ),
              ],
            ),
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

