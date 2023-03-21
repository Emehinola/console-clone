import 'package:get/get.dart';

class PatientSchedule {
  String? id;
  String patientName;
  String patientCase;
  Rx<String> appointmentDate;

  PatientSchedule({
    this.id,
    required this.patientCase,
    required this.patientName,
    required this.appointmentDate,
  });

  factory PatientSchedule.fromJson(Map json) {
    return PatientSchedule(
      id: json['id'],
      patientCase: json['patientCase'],
      patientName: json['patientName'],
      appointmentDate: (json['appointmentDate'] as String).obs,
    );
  }

  static Map<String, dynamic> toJson(PatientSchedule patient){
    return {
      'patientName': patient.patientName,
      'id': patient.id,
      'appointmentDate': patient.appointmentDate.value,
      'patientCase': patient.patientCase,
    };
  }
}
