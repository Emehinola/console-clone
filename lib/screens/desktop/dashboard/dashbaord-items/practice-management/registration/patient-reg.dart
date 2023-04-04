import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../widgets/desktop/patient-list-tiles.dart';
import 'form.dart';


class DesktopPatientRegistration extends StatefulWidget {
  const DesktopPatientRegistration({Key? key}) : super(key: key);

  @override
  _DesktopPatientRegistrationState createState() =>
      _DesktopPatientRegistrationState();
}

class _DesktopPatientRegistrationState
    extends State<DesktopPatientRegistration> {
  final _formKey = GlobalKey<FormState>();

  bool showForm = false;

  @override
  void initState() {
    if (ConsoleState.state.patientToEdit != null) {
      showForm = true;
    } else {
      ConsoleState.state.regViewText.value = "Registered Patients (Complete)";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsoleScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderMetrics(
            isUser: false,
            isReg: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.02.sw),
            child: Obx(
              () => Text(
                ConsoleState.state.regViewText.value,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 0.03.sh,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                      height: 0.9.sh,
                      child: !showForm
                          ? RegisteredPatient(
                              status: 'Completed',
                            )
                          : const PatientRegForm()),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            showForm
                                ? './assets/images/reg.png'
                                : './assets/images/reg-new.png',
                            height: 0.2.sh,
                          ),
                          SizedBox(
                            height: 0.06.sh,
                          ),
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 600),
                            crossFadeState: showForm
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            firstChild: FlatButton(
                                buttonText: 'Add New Patient',
                                verticalPadding: 0.015.sh,
                                onTap: () {
                                  setState(() {
                                    showForm = true;
                                  });
                                }),
                            secondChild: OutlinedBtn(
                              buttonText: 'See Full List',
                              borderColor: ColorPalette.mainButtonColor,
                              textColor: ColorPalette.mainButtonColor,
                              verticalPadding: 0.015.sh,
                              onTap: () {
                                setState(() {
                                  showForm = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

}

Widget previewText(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorPalette.offBlack,
            fontSize: 13),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Text(
        value,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: ColorPalette.grey),
      ),
    ],
  );
}

