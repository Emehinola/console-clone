import 'package:console/models/registered-patient.dart';
import 'package:get/get.dart';

import 'controller-variables.dart';

Rx<CurrentAuthScreen> currentScreen = CurrentAuthScreen.login.obs;
Rx<CurrentSelectedNavItem> selectedItem = CurrentSelectedNavItem.dashboard.obs;
final consoleState = Get.put(ConsoleState());

class ConsoleState extends GetxController{

  RegPatient? _patientToEdit;

  RegPatient? get patientToEdit => _patientToEdit;

  set patientToEdit(value){
    _patientToEdit = value;
    update();
  }
}