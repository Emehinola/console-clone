import 'package:console/widgets/desktop/dialogs.dart';

import '../models/registered-patient.dart';
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
  consoleState.patientToEdit = patient;

  selectedItem.value = CurrentSelectedNavItem.patientReg;
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

void viewPatientInfoReal(RegPatient patient){

  showInfoDialogueReal(patient);
}