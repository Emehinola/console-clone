import 'dart:convert';

class User {
  String username;
  String password;
  String fullName;
  String bioData;
  String officialDetails;
  String otherDetails;

  User({
    required this.username,
    required this.password,
    required this.fullName,
    required this.bioData,
    required this.officialDetails,
    required this.otherDetails,
  });

  factory User.fromJson(Map json) {
    return User(
      fullName: json['full_name'],
      username: json['username'],
      password: json['password'],
      bioData: json['biodata'],
      officialDetails: json['official_details'],
      otherDetails: json['other_details'],
    );
  }

  static Map<String, dynamic> toJson(User user){
    return {
    'full_name': user.fullName,
    'username': user.username,
    'password': user.password,
    'biodata': user.bioData,
    'official_details': user.officialDetails,
    'other_details': user.otherDetails,
  };
  }
}
