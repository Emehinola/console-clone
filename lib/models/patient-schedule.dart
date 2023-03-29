import 'package:console/models/registered-patient.dart';
import 'package:get/get.dart';

class PatientSchedule {
  String? id;
  String patientName;
  String patientCase;
  RegPatient? patient;
  Rx<String> appointmentDate;

  PatientSchedule({
    this.id,
    required this.patientCase,
    required this.patientName,
    required this.appointmentDate,
    this.patient,
  });

  factory PatientSchedule.fromJson(Map json) {
    return PatientSchedule(
      id: json['id'],
      patientCase: json['patientCase'],
      patientName: json['patientName'],
      patient: RegPatient.fromJson(json['patient']),
      appointmentDate: (json['appointmentDate'] as String).obs,
    );
  }

  static Map<String, dynamic> toJson(PatientSchedule patient){
    return {
      'patientName': patient.patientName,
      'id': patient.id,
      'appointmentDate': patient.appointmentDate.value,
      'patientCase': patient.patientCase,
      'patient': RegPatient.toJson(patient.patient!),
    };
  }
}
