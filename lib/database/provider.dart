// create database singleton
import 'dart:convert';

import 'package:console/models/patient-schedule.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/screens/mobile/dashboard/practice-mgt/registration/patients.dart';
import 'package:console/services/console-services.dart';
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

    for (var element in rawUsersList) {
      users.add(User.fromJson(element));
    }
    return users;
  }

  List<Map> getLocalUsers() {
    List<Map> users = [];

    try {
      var rawUsers = box.get('users');
      List rawUsersList = rawUsers.toList();

      for (var element in rawUsersList) {
        users.add(User.toJson(jsonDecode(element)));
      }
      return users;
    } catch (e) {
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

  User? getUserByUsername(String username) {
    List<User> users = getAllUsers();

    return users.singleWhere((element) => element.username == username);
  }

  // patient operations

  List<RegPatient> getAllPatients() {
    List<RegPatient> patients = [];
    var rawPat;
    List rawUsersList = [];

    try {
      rawPat = box.get('patients');

      rawUsersList = rawPat.toList();
    } catch (e) {
      //
    }

    for (var element in rawUsersList) {
      patients.add(RegPatient.fromJson(element));
    }
    return patients;
  }

  List<Map> getLocalPatients() {
    List<Map> patients = [];

    try {
      var rawPat = box.get('patients');
      List rawUsersList = rawPat.toList();

      print(rawUsersList);

      for (var element in rawUsersList) {
        patients.add(element);
      }
      return patients;
    } catch (e) {
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

  RegPatient? getPatientByID(String id) {
    List<RegPatient> patients = getAllPatients();

    print('patients: $patients');

    return patients.singleWhere((element) => element.id == id);
  }

  // schedules
  List<PatientSchedule> getAllSchedules() {
    List<PatientSchedule> schedules = [];
    var rawPat;
    List rawSch = [];

    try {
      rawPat = box.get('schedules');

      rawSch = rawPat.toList();
    } catch (e) {
      //
    }

    for (var element in rawSch) {
      schedules.add(PatientSchedule.fromJson(element));
    }

    return schedules;
  }

  List<PatientSchedule> getTodaySchedules() {
    List<PatientSchedule> schedules = [];
    PatientSchedule? schedule;
    var rawPat;
    List rawSch = [];

    try {
      rawPat = box.get('schedules');

      rawSch = rawPat.toList();
    } catch (e) {
      //
    }

    for (var element in rawSch) {
      schedule = PatientSchedule.fromJson(element);

      if (ConsoleService.isToday(schedule.appointmentDate.value)) {
        schedules.add(schedule);
      }
    }

    return schedules;
  }

  List<PatientSchedule> getTomorrowSchedules() {
    List<PatientSchedule> schedules = [];
    PatientSchedule? schedule;
    var rawPat;
    List rawSch = [];

    try {
      rawPat = box.get('schedules');

      rawSch = rawPat.toList();
    } catch (e) {
      //
    }

    for (var element in rawSch) {
      schedule = PatientSchedule.fromJson(element);

      if (ConsoleService.isTomorrow(schedule.appointmentDate.value)) {
        schedules.add(schedule);
      }
    }

    return schedules;
  }

  List<PatientSchedule> getWeekSchedules() {
    List<PatientSchedule> schedules = [];
    PatientSchedule? schedule;
    var rawPat;
    List rawSch = [];

    try {
      rawPat = box.get('schedules');

      rawSch = rawPat.toList();
    } catch (e) {
      //
    }

    for (var element in rawSch) {
      schedule = PatientSchedule.fromJson(element);

      if (ConsoleService.isThisWeek(schedule.appointmentDate.value)) {
        schedules.add(schedule);
      }
    }

    return schedules;
  }

  List<Map> getLocalSchedule() {
    List<Map> schedules = [];

    try {
      var rawPat = box.get('schedules');
      List rawSch = rawPat.toList();

      for (var element in rawSch) {
        schedules.add(element);
      }
      return schedules;
    } catch (e) {
      print('e: $e');
    }

    return [];
  }

  insertSchedule(PatientSchedule patient, {List<Map>? newSch}) async {
    Map patMap = PatientSchedule.toJson(patient);
    List<Map> previousSch = newSch ?? getLocalSchedule();
    previousSch.add(patMap);

    await box.put('schedules', previousSch);
  }

  PatientSchedule? getScheduleById(String id) {
    try {
      List<PatientSchedule> patients = getAllSchedules();
      return patients.singleWhere((element) => element.id == id);
    } catch (e) {
      //
    }

    return null;
  }

  Future<bool> editSchedule(PatientSchedule schedule) async {
    try {
      List<Map> newSch = getLocalSchedule()
          .where((element) => element['id'] != schedule.id)
          .toList();
      insertSchedule(schedule, newSch: newSch);

      return true;
    } catch (e) {
      //
    }

    return false;
  }
}
