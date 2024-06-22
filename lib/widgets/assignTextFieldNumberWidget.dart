
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receptionist/constants/colors.dart';
import 'package:receptionist/constants/patient_list.dart';

class AssignTextField2 extends StatelessWidget {
  const AssignTextField2({
    super.key,
    required this.controller,
    required this.title,
    required this.lookingFor,
  });

  final TextEditingController controller;
  final String title;
  final String lookingFor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            "${title} : ",
            style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: TypeAheadField(
              controller: controller,
              itemBuilder: (context, dataitem) {
                return ListTile(
                  leading: Image(image: AssetImage(dataitem.icon), height: 40,),
                  title: Text("${dataitem}"),
                );
              },
              onSelected: (value) {
                controller.text = value.toString();
              },
              suggestionsCallback: (search) {
                return patients.where((element){
                  return element.phoneNumber.contains(search);
                }).toList();
              },
              builder: (context, con, focusNode) {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Please Fill This Field";
                    }
                    return null;
                  },
              style: GoogleFonts.lato(
                fontSize: 18,
                color: MyColors.white,
              ),
              controller: con,
              focusNode: focusNode,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                isCollapsed: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                fillColor: MyColors.Burgundy,
                filled: true,
              ),
            );
              },
            ),
          )
        ],
      ),
    );
  }
}