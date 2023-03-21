import 'package:console/database/provider.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/state-management/state-management.dart';

Future<bool> schedulePatient() async {

  if(ConsoleState.state.patientSchedule == null) return false;
  try {
    PatientSchedule patient = PatientSchedule(
      id: ConsoleState.state.patientSchedule!.id,
      patientName: ConsoleState.state.patientSchedule!.patientName,
      patientCase: ConsoleState.state.patientSchedule!.patientCase,
      appointmentDate: ConsoleState.state.patientSchedule!.appointmentDate,
    );
    await DBProvider.db.insertSchedule(patient);

    return true;
  } catch (e) {
    print('preg: $e');
  }

  return false;
}