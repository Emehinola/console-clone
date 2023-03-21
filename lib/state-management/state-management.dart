import 'package:console/models/patient-schedule.dart';
import 'package:console/models/registered-patient.dart';
import 'package:get/get.dart';

import 'controller-variables.dart';

Rx<CurrentAuthScreen> currentScreen = CurrentAuthScreen.login.obs;
Rx<CurrentSelectedNavItem> selectedItem = CurrentSelectedNavItem.dashboard.obs;
// final consoleState = Get.put(ConsoleState());

class ConsoleState extends GetxController{
  ConsoleState._();

  Rx<bool> loading = false.obs;
  Rx<bool> editAction = false.obs;

  Rx<String> regViewText = "Registered Users (Incomplete)".obs;

  static final ConsoleState state = ConsoleState._(); // singleton

  RegPatient? _patientToEdit;
  RegPatient? get patientToEdit => _patientToEdit;

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
}