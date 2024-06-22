
import 'package:flutter/material.dart';

class BillDialog extends StatelessWidget {
  final List<Map<String, String>> billDetails;
  final double total;

  const BillDialog({
    super.key,
    required this.billDetails,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Bill Details'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            ...billDetails.map((detail) {
              return Text('Service: ${detail['service']}, Charges: ${detail['charges']}');
            }).toList(),
            const SizedBox(height: 20),
            Text('Total: ${total.toStringAsFixed(2)} Rupees'),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
