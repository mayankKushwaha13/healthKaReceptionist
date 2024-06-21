
import 'package:flutter/material.dart';
import 'package:doctor_records/asset/constants/colors.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _chargesController = TextEditingController();

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Bill',style: TextStyle(color: MyColors.Seashell),),
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: _serviceTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Service Type',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: MyColors.Peach,
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
                    fillColor: MyColors.Peach,
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
                        backgroundColor:  MyColors.Rosewood,

                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text('Print',style:TextStyle(color: MyColors.Seashell),),
                    ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

