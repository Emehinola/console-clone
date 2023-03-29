// create database singleton
import 'dart:convert';

import 'package:console/models/patient-schedule.dart';
import 'package:console/models/registered-patient.dart';
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

    await box.put('patients', previousPatient);
  }

  RegPatient? getPatientByID(String id) {
    try {
      List<RegPatient> patients = getAllPatients();

      return patients.singleWhere((element) => element.id.toString() == id);
    } catch (e) {
      // TODO: handle exception
    }

    return null;
  }

  Future<void> deleteAllPatients() async {
    await box.put('patients', []);
  }

  Future<void> deleteAllSchedules() async {
    await box.put('schedules', []);
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

  insertSchedule(PatientSchedule schedule, {List<Map>? newSch}) async {
    Map patMap = PatientSchedule.toJson(schedule);
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

  // schedules
  List<PatientEngagement> getAllEngagements() {
    List<PatientEngagement> engagements = [];
    var rawPat;
    List rawSch = [];

    try {
      rawPat = box.get('engagements');

      rawSch = rawPat.toList();
    } catch (e) {
      //
    }

    for (var element in rawSch) {
      engagements.add(PatientEngagement.fromJson(element));
    }

    return engagements;
  }

  List<Map> getLocalEngagements() {
    List<Map> engagements = [];

    try {
      var rawPat = box.get('engagements');
      List rawSch = rawPat.toList();

      for (var element in rawSch) {
        engagements.add(element);
      }
      return engagements;
    } catch (e) {
      print('e: $e');
    }

    return [];
  }

  insertEngagement(PatientEngagement engagement, {List<Map>? newSch}) async {
    Map patMap = PatientEngagement.toJson(engagement);
    List<Map> previousSch = newSch ?? getLocalEngagements();
    previousSch.add(patMap);

    await box.put('engagements', previousSch);
  }

  PatientEngagement? getEngagementById(String id) {
    try {
      List<PatientEngagement> patients = getAllEngagements();
      // return patients.singleWhere((element) => element.id == id);
    } catch (e) {
      //
    }

    return null;
  }

  Future<bool> editEngagement(PatientEngagement engagement) async {
    try {
      List<Map> newSch = getLocalSchedule()
          .where((element) => element['id'] != engagement.respiratoryRate)
          .toList();
      insertEngagement(engagement, newSch: newSch);

      return true;
    } catch (e) {
      //
    }

    return false;
  }
}
