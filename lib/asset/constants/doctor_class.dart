class Doctor {
  final String firstName;
  final String lastName;
  final String doctorId;
  final String specialisation;
  final String phoneNumber;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.doctorId,
    required this.specialisation,
    required this.phoneNumber,
  });
}
final List<Doctor> doctors = [
  Doctor(firstName: 'Soumyajith', lastName: 'Battacharya', doctorId: 'D001', specialisation: 'Cardiology', phoneNumber: '1234567890'),
  Doctor(firstName: 'Mayank', lastName: '', doctorId: 'D002', specialisation: 'Cardiology', phoneNumber: '1234567890'),
  Doctor(firstName: 'Gayathri', lastName: '', doctorId: 'D003', specialisation: 'Cardiology', phoneNumber: '1234567890'),

];