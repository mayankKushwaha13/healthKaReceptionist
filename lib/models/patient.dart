
class Patient {
  final String name;
  final String phoneNumber;
  final String firstVisitDate;
  final String gender;
  final String icon;
  final String type;

  Patient({required this.name, required this.phoneNumber, required this.firstVisitDate, required this.gender, 
  this.icon = "lib/assets/patient.png", this.type = "Check Up",
  });

  @override
  String toString(){
    return name;
  }
}