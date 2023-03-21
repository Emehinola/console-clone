import 'package:console/widgets/desktop/dialogs.dart';
import 'package:get/get.dart';

import '../models/registered-patient.dart';
import '../models/user.dart';
import '../screens/desktop/dashboard/navigation.dart';
import '../state-management/controller-variables.dart';
import '../state-management/state-management.dart';

void editPatientInfo(){
  RegPatient patient = RegPatient(
    id: 'ID',
    phone: '8131615393',
    acctTier: 'Tier 1',
    biodata: 'A software developer',
    contactDetails: 'developer@mailinator.com',
    medRecord: 'Neutral',
    patientName: 'Emehinola Samuel',
    principalDesignation: 'Great principal',
    principalWorkDetails: 'Great principal work details',
  );
  ConsoleState.state.patientToEdit = patient;

  selectedItem.value = CurrentSelectedNavItem.patientReg;
}

void editPatientInfoReal(RegPatient patient, {bool fromReg = false}){

  if(fromReg){
    ConsoleState.state.regViewText.value = "Update user profile";
    Get.to(DesktopNavigation());
    ConsoleState.state.patientToEdit = patient;
    selectedItem.value = CurrentSelectedNavItem.patientReg;

    return;
  }
  ConsoleState.state.patientToEdit = patient;

  selectedItem.value = CurrentSelectedNavItem.patientReg;
}

void editUserInfoReal(User user, {bool fromReg = false}){

  if(fromReg){
    ConsoleState.state.regViewText.value = "Update user profile";
    Get.to(DesktopNavigation());
    ConsoleState.state.userToEdit = user;
    selectedItem.value = CurrentSelectedNavItem.patientReg;

    return;
  }
  ConsoleState.state.userToEdit = user;

  showUserEditDialog(user, fromReg: fromReg);
}

void viewPatientInfo(){
  RegPatient patient = RegPatient(
    id: 'ID',
    phone: '8131615393',
    acctTier: 'Tier 1',
    biodata: 'A software developer',
    contactDetails: 'developer@mailinator.com',
    medRecord: 'Neutral',
    patientName: 'Emehinola Samuel',
    principalDesignation: 'Great principal',
    principalWorkDetails: 'Great principal work details',
  );

  showInfoDialogue(patient);
}

void viewPatientInfoReal(RegPatient patient, bool fromReg){
  showInfoDialogueReal(patient, fromReg: fromReg);
}

void viewUserInfoReal(User user, bool fromReg){
  showUserInfoDialogueReal(user, fromReg: fromReg);
}