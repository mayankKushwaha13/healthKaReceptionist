import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receptionist/constants/colors.dart';

class ServiceField extends StatelessWidget {
  final TextEditingController serviceTypeController;
  final TextEditingController chargesController;
  final VoidCallback onRemove;

  const ServiceField({
    super.key,
    required this.serviceTypeController,
    required this.chargesController,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: serviceTypeController,
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
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: MyColors.Rosewood),
              onPressed: onRemove,
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: chargesController,
          decoration: const InputDecoration(
            labelText: 'Charges',
            border: OutlineInputBorder(),
            filled: true,
            fillColor: MyColors.Peach,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the charges';
            }
            return null;
          },
        ),
      ],
    );
  }
}