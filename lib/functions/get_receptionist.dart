import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receptionist/constants/API/receptionist.dart';
import 'package:receptionist/data/shared_preferences.dart';

getReceptionist(String id)async{
  var response = await http.post(
    Uri.parse("$recepAPI/get_receptionist_profile_mobile"),
    headers: {
      'Content-type' : 'application/json',
      'Accept' : 'application/json'
    },
    body: jsonEncode({
      'receptionist_id' : id
    })
  );
  print(response.statusCode);
  if (response.statusCode == 200){
    var data = jsonDecode(response.body)['data'].first;
    SP.sp!.setString(SP.name, data['receptionist_name']);
    SP.sp!.setString(SP.gender, data['gender']);
    SP.sp!.setString(SP.phoneNumber, data['phone_number']);
    SP.sp!.setString(SP.age, data['age'].toString());
    print("Done");
  }
  else{
    print("error");
  }
}