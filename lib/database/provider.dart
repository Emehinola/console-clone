// create database singleton
import 'dart:convert';

import 'package:console/models/registered-patient.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  var box = Hive.box('console');

  List<User> getAllUsers() {
    List<User> users = [];

    var rawUsers = box.get('users');
    List rawUsersList = rawUsers.toList();

    for (var element in rawUsersList) { print(element.runtimeType); users.add(User.fromJson(element)); }
    return users;
  }

  List<Map> getLocalUsers() {
    List<Map> users = [];

    try{
      var rawUsers = box.get('users');
      List rawUsersList = rawUsers.toList();

      for (var element in rawUsersList) { users.add(User.toJson(jsonDecode(element))); }
      return users;
    }catch(e){
      //
    }

    return [];
  }

  insertUser(User user) async {
      Map userMap = User.toJson(user);
      List<Map> previousUsers = getLocalUsers();
      previousUsers.add(userMap);

      await box.put('users', previousUsers);
  }

  User? getUserByUsername(String username){
    List<User> users = getAllUsers();

    print('users: $users');

    return users.singleWhere((element) => element.username == username);
  }

  // patient operations

  List<RegPatient> getAllPatients() {
    List<RegPatient> patients = [];
    var rawPat;
    List rawUsersList = [];

    try{
      rawPat = box.get('patients');

      rawUsersList = rawPat.toList();
    }catch(e){
      //
    }

    for (var element in rawUsersList) { patients.add(RegPatient.fromJson(element)); }
    return patients;
  }

  List<Map> getLocalPatients() {
    List<Map> patients = [];

    try{
      var rawPat = box.get('patients');
      List rawUsersList = rawPat.toList();

      print(rawUsersList);

      for (var element in rawUsersList) { patients.add(element); }
      return patients;
    }catch(e){
      print('e: $e');
    }

    return [];
  }

  insertPatient(RegPatient patient) async {
    Map patMap = RegPatient.toJson(patient);
    List<Map> previousPatient = getLocalPatients();
    previousPatient.add(patMap);

    print(previousPatient);

    await box.put('patients', previousPatient);
  }

  RegPatient? getPatientByID(String id){
    List<RegPatient> patients = getAllPatients();

    print('patients: $patients');

    return patients.singleWhere((element) => element.id == id);
  }
}