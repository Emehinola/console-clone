import 'dart:convert';

class User {
  String username;
  String password;
  String firstName;
  String lastName;
  String middleName;
  String socHandle;
  String phone;
  String nationality;
  String ethnicity;
  String religion;
  String lga;
  String primaryAssignment;
  String rank;
  String position;
  String garrison;
  String division;
  String platoon;
  String unit;

  User({
    required this.username,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.phone,
    required this.password,
    required this.lga,
    required this.division,
    required this.ethnicity,
    required this.garrison,
    required this.nationality,
    required this.platoon,
    required this.position,
    required this.primaryAssignment,
    required this.rank,
    required this.religion,
    required this.socHandle,
    required this.unit,
  });

  factory User.fromJson(Map json) {
    return User(
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      username: json['username'],
      socHandle: json['socHandle'],
      phone: json['phone'],
      lga: json['lga'],
      division: json['division'],
      ethnicity: json['ethnicity'],
      garrison: json['garrison'],
      nationality: json['nationality'],
      platoon: json['platoon'],
      position: json['position'],
      primaryAssignment: json['primaryAssignment'],
      rank: json['rank'],
      religion: json['religion'],
      unit: json['unit'],
      password: json['password']
    );
  }

  static Map<String, dynamic> toJson(User user){
    return {
      'firstName': user.firstName,
      'middleName': user.middleName,
      'lastName': user.lastName,
      'socHandle': user.socHandle,
      'phone': user.phone,
      'nationality': user.nationality,
      'ethnicity': user.ethnicity,
      'religion': user.religion,
      'lga': user.lga,
      'username': user.username,
      'primaryAssignment': user.primaryAssignment,
      'rank': user.rank,
      'position': user.position,
      'garrison': user.garrison,
      'division': user.division,
      'platoon': user.platoon,
      'unit':user.unit,
      'password': user.password,
  };
  }
}
