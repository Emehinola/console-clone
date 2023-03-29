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

  static Map<String, dynamic> toJson(PatientSchedule patient) {
    return {
      'patientName': patient.patientName,
      'id': patient.id,
      'appointmentDate': patient.appointmentDate.value,
      'patientCase': patient.patientCase,
      'patient': RegPatient.toJson(patient.patient!),
    };
  }
}

class PatientEngagement {
  PatientSchedule? schedule;
  String temperature;
  String pulse;
  String upperBloodPressure;
  String lowerBloodPressure;
  String oxySaturation;
  String respiratoryRate;
  String height;
  String weight;

  PatientEngagement({
    required this.schedule,
    required this.pulse,
    required this.temperature,
    required this.height,
    required this.weight,
    required this.lowerBloodPressure,
    required this.oxySaturation,
    required this.respiratoryRate,
    required this.upperBloodPressure,
  });

  factory PatientEngagement.fromJson(Map json) {
    return PatientEngagement(
      schedule: PatientSchedule.fromJson(json['schedule']),
      temperature: json['temperature'],
      pulse: json['pulse'],
      height: json['height'],
      weight: json['weight'],
      lowerBloodPressure: json['lowerBloodPressure'],
      upperBloodPressure: json['upperBloodPressure'],
      oxySaturation: json['oxySaturation'],
      respiratoryRate: json['respiratoryRate'],
    );
  }

  static Map<String, dynamic> toJson(PatientEngagement engagement) {
    return {
      'schedule': PatientSchedule.toJson(engagement.schedule!),
      'temperature': engagement.temperature,
      'pulse': engagement.pulse,
      'height': engagement.height,
      'weight': engagement.weight,
      'lowerBloodPressure': engagement.lowerBloodPressure,
      'upperBloodPressure': engagement.upperBloodPressure,
      'oxySaturation': engagement.oxySaturation,
      'respiratoryRate': engagement.respiratoryRate,
    };
  }
}
