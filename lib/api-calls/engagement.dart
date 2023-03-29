import 'package:console/database/provider.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/state-management/state-management.dart';
import '../widgets/desktop/dialogs.dart';

Future<bool> createEngagement(PatientEngagement engagement) async {
  try {
    await DBProvider.db.insertEngagement(engagement);
    showSuccessDialog(
        'Success', 'Patient engagement submitted');
    return true;
  } catch (e) {
    //
  }

  return false;
}

Future<bool> editEngagement(PatientEngagement engagement) async {
  await Future.delayed(const Duration(seconds: 3));

  ConsoleState.state.loading.value = true;

  try {
    if (await DBProvider.db.editEngagement(engagement)) {
      return true;
    }
  } catch (e) {
    //
  }

  ConsoleState.state.loading.value = false;

  return false;
}
