import 'package:console/database/provider.dart';
import 'package:hive/hive.dart';

class RegPatient {
  String? id;
  String firstName;
  String lastName;
  String? groupType;
  String acctTier;
  String phone;
  String? date;
  String bloodGroup;
  String genotype;
  String? photograph;
  String sex;
  int age;
  double height;
  double weight;
  String? bmi;

  // contact
  String email;
  String address;
  String socHandle;

  // principal des
  String rank;
  String position;
  String platoon;
  String division;
  String garrison;
  String unit;
  String primaryAss;

  RegPatient({
    this.id,
    required this.phone,
    this.groupType,
    required this.acctTier,
    required this.firstName,
    required this.lastName,
    required this.height,
    required this.weight,
    required this.age,
    required this.genotype,
    required this.bloodGroup,
    required this.sex,
    required this.unit,
    required this.garrison,
    required this.position,
    required this.email,
    required this.address,
    required this.primaryAss,
    required this.rank,
    required this.socHandle,
    required this.platoon,
    required this.division,
    this.photograph,
    this.bmi,
    this.date,
  });

  factory RegPatient.fromJson(Map json) {
    return RegPatient(
      id: json['id'],
      phone: json['phone'],
      groupType: json['groupType'],
      acctTier: json['accountTier'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      height: json['height'],
      weight: json['weight'],
      age: json['age'],
      bloodGroup: json['bloodGroup'],
      genotype: json['genotype'],
      bmi: json['bmi'],
      photograph: json['photograph'],
      sex: json['sex'],
      date: json['date'],
      email: json['email'],
      address: json['address'],
      garrison: json['garrison'],
      position: json['position'],
      primaryAss: json['primaryAss'],
      rank: json['rank'],
      socHandle: json['socHandle'],
      unit: json['unit'],
      platoon: json['platoon'],
      division: json['division'],
    );
  }

  static Map<String, dynamic> toJson(RegPatient patient) {
    return {
      'id': patient.id,
      'phone': patient.phone,
      'groupType': patient.groupType,
      'accountTier': patient.acctTier,
      'firstName': patient.firstName,
      'lastName': patient.lastName,
      'height': patient.height,
      'weight': patient.weight,
      'age': patient.age,
      'bloodGroup': patient.bloodGroup,
      'genotype': patient.genotype,
      'bmi': patient.bmi,
      'photograph': patient.photograph,
      'sex': patient.sex,
      'date': patient.date,
      'email': patient.email,
      'address': patient.address,
      'garrison': patient.garrison,
      'position': patient.position,
      'primaryAss': patient.primaryAss,
      'rank': patient.rank,
      'socHandle': patient.socHandle,
      'unit': patient.unit,
      'platoon': patient.platoon,
      'division': patient.division,
    };
  }
}
