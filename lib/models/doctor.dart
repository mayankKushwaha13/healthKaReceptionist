class Doctor {
  final String firstName;
  final String lastName;
  final String doctorId;
  final String specialisation;
  // final String phoneNumber;
  final String image;
  final String qualification;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.doctorId,
    required this.specialisation,
    // required this.phoneNumber,
    this.image = "lib/assets/doctor.png",
    this.qualification = "MBBS",
  });

  factory Doctor.fromTable(Map<String, dynamic> map) {
    return Doctor(
      firstName: map["firstName"],
      lastName: map["lastName"],
      doctorId: map["doctorID"],
      specialisation: map["specialization"],
      // phoneNumber: map["phoneNumber"]
    );
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      firstName: map["first_name"],
      lastName: map["second_name"],
      doctorId: map["doctor_id"],
      specialisation: map["specialization"],
      // phoneNumber: map["phone_number"]
    );
  }

  Map<String, dynamic> toTable() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "doctorID": doctorId,
      // "phoneNumber": phoneNumber,
      "specialization": specialisation
    };
  }
}
