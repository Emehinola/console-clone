import 'package:get/get.dart';

import '../../models/registered-patient.dart';
import '../../screens/mobile/dashboard/practice-mgt/registration/patient-registration.dart';
import '../../state-management/state-management.dart';

void mobilePatientEdit(){
    RegPatient patient = RegPatient(
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

    Get.to(const PatientRegistration());

}