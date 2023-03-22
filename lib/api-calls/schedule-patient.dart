import 'package:console/database/provider.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/state-management/state-management.dart';

Future<bool> schedulePatient() async {
  if (ConsoleState.state.patientSchedule == null) return false;
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

Future<bool> editSchedule(PatientSchedule schedule) async {
  await Future.delayed(const Duration(seconds: 3));

  ConsoleState.state.loading.value = true;

  try {
    if (await DBProvider.db.editSchedule(schedule)) {
      return true;
    }
  } catch (e) {
    //
  }

  ConsoleState.state.loading.value = false;

  return false;
}
