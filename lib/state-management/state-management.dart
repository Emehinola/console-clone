import 'package:console/models/patient-schedule.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/models/user.dart';
import 'package:get/get.dart';

import 'controller-variables.dart';

Rx<CurrentAuthScreen> currentScreen = CurrentAuthScreen.login.obs;
Rx<CurrentSelectedNavItem> selectedItem = CurrentSelectedNavItem.dashboard.obs;
// final consoleState = Get.put(ConsoleState());

class ConsoleState extends GetxController{
  ConsoleState._();

  static final ConsoleState state = ConsoleState._(); // singleton

  Rx<bool> loading = false.obs;
  Rx<bool> editAction = false.obs;
  Rx<bool> isScheduleViewOnly = true.obs;
  Rx<bool> isUserRegistered = true.obs;
  Rx<bool> showEngagementForm = false.obs;
  Rx<bool> showAllEngagements = false.obs;

  Rx<String> regViewText = "Registered Patients (Incomplete)".obs;

  RegPatient? _patientToEdit;
  RegPatient? get patientToEdit => _patientToEdit;

  PatientSchedule? _scheduleToEngage;
  PatientSchedule? get scheduleToEngage => _scheduleToEngage;

  User? _user;
  User? get user => _user;

  User? _userToEdit;
  User? get userToEdit => _userToEdit;

  // schedule
  PatientSchedule? _patientSchedule;
  PatientSchedule? get patientSchedule => _patientSchedule;

  set patientToEdit(value){
    _patientToEdit = value;
    update();
  }

  set patientSchedule(value){
    _patientSchedule = value;
    update();
  }

  set user(value){
    _user = value;
    update();
  }

  set userToEdit(value){
    _userToEdit = value;
    update();
  }

  set scheduleToEngage(value){
    _scheduleToEngage = value;
    update();
  }
}