import 'dart:io';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../../api-calls/engagement.dart';
import '../../../../services/validation-service.dart';
import '../../../../widgets/desktop/dialogs.dart';
import '../../../../widgets/desktop/patient-list-tiles.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../dashboard.dart';

class DesktopPatientEngagement extends StatefulWidget {
  const DesktopPatientEngagement({Key? key}) : super(key: key);

  @override
  State<DesktopPatientEngagement> createState() => _PatientsListState();
}

class _PatientsListState extends State<DesktopPatientEngagement> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    ConsoleState.state.showEngagementForm.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderMetrics(isEngagement: true),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                Obx(
                  () => Expanded(
                    flex: ConsoleState.state.showAllEngagements.value ? 1 : 3,
                    child: Visibility(
                      visible: !ConsoleState.state.showAllEngagements.value,
                      replacement: EngagementTable(),
                      child: DesktopPatienntScheduleTable(
                        status: "Complete",
                        fromEngagement: true,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: !ConsoleState.state.showAllEngagements.value,
                    child: Expanded(
                        flex: 2,
                        child: Obx(() {
                          return Visibility(
                            visible:
                                ConsoleState.state.showEngagementForm.value,
                            replacement: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'No patient selected',
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            child: const EngagementRegForm(),
                          );
                        })),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildEngagementCard extends StatelessWidget {
  const BuildEngagementCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        // padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 0.01.sw),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  'Patient Engagement',
                  style: TextStyle(
                    color: ColorPalette.grey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      // SchedulePatientCard(
                      //   status: 'Engaged',
                      // ),
                      Text(
                        "Pick Engagement Date",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorPalette.grey),
                      ),
                      CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                        ),
                        onValueChanged: (dates) {},
                        initialValue: [],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedBtn(
                            buttonText: 'Clear Fields',
                            verticalPadding: 0.02.sh,
                            horPadding: 40,
                            borderColor: ColorPalette.mainButtonColor,
                            textColor: ColorPalette.mainButtonColor,
                            applyingMargin: false,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            buttonText: 'Register',
                            applyingMargin: false,
                            verticalPadding: 0.02.sh,
                            horPaddding: 40,
                            onTap: () => showSuccessDialog('Success!',
                                'Engagement registered successfully'),
                          ),
                          const SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class EngagementRegForm extends StatefulWidget {
  const EngagementRegForm({Key? key}) : super(key: key);

  @override
  State<EngagementRegForm> createState() => _PatientRegFormState();
}

class _PatientRegFormState extends State<EngagementRegForm> {
  final _formKey = GlobalKey<FormState>();

  final tempController = TextEditingController();
  final lowerBloodController = TextEditingController();
  final upperBloodController = TextEditingController();
  final pulseController = TextEditingController();
  final oxygenSaturationController = TextEditingController();
  final respiratoryController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  bool loading = false;

  File? _file;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              'Patient Engagement',
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: tempController,
                    hintText: 'Temperature',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: pulseController,
                    hintText: 'Pulse',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: upperBloodController,
                    hintText: 'Upper Blood Pressure',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: lowerBloodController,
                    hintText: 'Lower Blood Pressure',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: oxygenSaturationController,
                    hintText: 'Oxygen Saturation',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: respiratoryController,
                    hintText: 'Respiratory Rate',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: heightController,
                    hintText: 'Height(cm)',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidNumber(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: weightController,
                    hintText: 'Weight(kg)',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidNumber(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () => _pickFile(),
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.03.sh, horizontal: 0.02.sw),
                  decoration: DottedDecoration(
                    color: ColorPalette.mainButtonColor.withOpacity(0.5),
                    shape: Shape.box,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        IconlyBold.upload,
                        color: _file == null
                            ? Colors.grey
                            : ColorPalette.mainButtonColor,
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        _file == null
                            ? 'Attach document'
                            : fileName(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: _file == null
                              ? Colors.grey
                              : ColorPalette.mainButtonColor,
                        ),
                      ),
                     if(_file != null) IconButton(
                        padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              _file = null;
                            });
                          },
                          icon: const Icon(IconlyBold.delete, size: 15, color: Colors.red,))
                    ],
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedBtn(
                  buttonText: 'Clear',
                  applyingMargin: false,
                  verticalPadding: 0.018.sh,
                  borderColor: ColorPalette.mainButtonColor,
                  textColor: ColorPalette.mainButtonColor,
                  horPadding: 0.05.sw,
                  onTap: () {
                    //
                  },
                ),
                SizedBox(
                  width: 0.02.sw,
                ),
                FlatButton(
                  buttonText: 'Submit',
                  applyingMargin: false,
                  verticalPadding: 0.018.sh,
                  horPaddding: 0.05.sw,
                  loading: loading,
                  onTap: () async {
                    if (!_formKey.currentState!.validate() || _file == null) return;
                    setState(() {
                      loading = true;
                    });

                    PatientEngagement engagement = PatientEngagement(
                      schedule: ConsoleState.state.scheduleToEngage,
                      pulse: pulseController.text,
                      temperature: tempController.text,
                      height: heightController.text,
                      weight: weightController.text,
                      lowerBloodPressure: lowerBloodController.text,
                      oxySaturation: oxygenSaturationController.text,
                      respiratoryRate: respiratoryController.text,
                      upperBloodPressure: upperBloodController.text,
                      attachment: _file?.path.toString()
                    );

                    await createEngagement(engagement);

                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _file = File(result.paths.single.toString());
      });
    } else {}
  }

  String fileName(){
    return Platform.isMacOS ? '${_file?.path.split(r'/').last}' : '${_file?.path.split(r'\').last}';
  }
}
