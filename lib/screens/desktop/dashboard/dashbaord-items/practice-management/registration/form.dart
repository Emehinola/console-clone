import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../api-calls/patients.dart';
import '../../../../../../services/validation-service.dart';
import '../../../../../../state-management/controller-variables.dart';
import '../../../../../../state-management/state-management.dart';
import '../../../../../../widgets/desktop/dialogs.dart';
import '../../../../../../widgets/mob-desk/buttons/console-text-button.dart';
import '../../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../../widgets/mob-desk/forms/dropdowns.dart';
import '../../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../../../../widgets/mobile/drawer.dart';

class PatientRegForm extends StatefulWidget {
  const PatientRegForm({Key? key}) : super(key: key);

  @override
  State<PatientRegForm> createState() => _PatientRegFormState();
}

class _PatientRegFormState extends State<PatientRegForm> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final platoonController = TextEditingController();
  final divisionController = TextEditingController();
  final unitController = TextEditingController();
  final primAssController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final garrisonController = TextEditingController();
  final positionController = TextEditingController();
  final rankController = TextEditingController();
  final socHandleController = TextEditingController();

  bool loading = false;

  File? _image;

  String _cameraInfo = 'Unknown';
  List<CameraDescription> _cameras = <CameraDescription>[];
  int _cameraIndex = 0;
  int _cameraId = -1;
  bool _initialized = false;
  bool _previewPaused = false;
  Size? _previewSize;
  ResolutionPreset _resolutionPreset = ResolutionPreset.veryHigh;
  StreamSubscription<CameraErrorEvent>? _errorStreamSubscription;
  StreamSubscription<CameraClosingEvent>? _cameraClosingStreamSubscription;

  @override
  void initState() {
    if (ConsoleState.state.patientToEdit != null) {
      firstNameController.text = ConsoleState.state.patientToEdit!.firstName;
      lastNameController.text = ConsoleState.state.patientToEdit!.lastName;
      middleNameController.text = ConsoleState.state.patientToEdit!.firstName;
      phoneController.text = ConsoleState.state.patientToEdit!.phone;
      emailController.text = ConsoleState.state.patientToEdit!.email;
      addressController.text = ConsoleState.state.patientToEdit!.address;
      platoonController.text = ConsoleState.state.patientToEdit!.platoon;
      divisionController.text = ConsoleState.state.patientToEdit!.division;
      unitController.text = ConsoleState.state.patientToEdit!.unit;
      primAssController.text = ConsoleState.state.patientToEdit!.primaryAss;
      ageController.text = ConsoleState.state.patientToEdit!.age.toString();
      heightController.text =
          ConsoleState.state.patientToEdit!.height.toString();
      weightController.text =
          ConsoleState.state.patientToEdit!.weight.toString();
      garrisonController.text =
          ConsoleState.state.patientToEdit!.garrison.toString();
      positionController.text =
          ConsoleState.state.patientToEdit!.position.toString();
      rankController.text = ConsoleState.state.patientToEdit!.rank.toString();
      socHandleController.text =
          ConsoleState.state.patientToEdit!.socHandle.toString();
    }

    WidgetsFlutterBinding.ensureInitialized();
    _fetchCameras();
    super.initState();
  }

  @override
  void dispose() {
    _disposeCurrentCamera();
    _errorStreamSubscription?.cancel();
    _errorStreamSubscription = null;
    _cameraClosingStreamSubscription?.cancel();
    _cameraClosingStreamSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0.02.sw, right: 0.1.sw),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'),
              opacity: 0.08,
              fit: BoxFit.cover)),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (_image == null)
                      const CircleAvatar(
                        backgroundImage: AssetImage('./assets/images/06.png'),
                      ),
                    if (_image != null)
                      CircleAvatar(
                          backgroundImage: FileImage(File(_image!.path))),
                    if (_initialized && _cameraId > 0 && _previewSize != null)
                      _buildPreview(),
                    Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.7)),
                          child: IconButton(
                              onPressed: _select,
                              icon: const Icon(
                                CupertinoIcons.camera,
                                size: 15,
                                color: Colors.white,
                              )),
                        ))
                  ],
                ),
              ),
            ),
            if (_initialized && _cameraId > 0 && _previewSize != null)
            const SizedBox(height: 10.0,),
            if (_initialized && _cameraId > 0 && _previewSize != null)
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 0.1.sw,
                child: FlatButton(
                  buttonText: 'Capture',
                  onTap: _takePicture,
                ),
              ),
            ),
            title('Personal Details'),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
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
                    controller: lastNameController,
                    hintText: 'Last Name',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: middleNameController,
                    hintText: 'Middle Name',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Group Type',
                    options: const [
                      'Group',
                      'Single',
                    ],
                    value: 'Group',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
              ],
            ),
            title('Health Records'),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Blood Group',
                    options: const ['A+', 'A-', 'B-', 'B+', '0+'],
                    value: 'A+',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Genotype',
                    options: const [
                      'AA',
                      'AS',
                      'SS',
                    ],
                    value: 'AA',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: ageController,
                    hintText: 'Age',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidNumber(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Sex',
                    options: const [
                      'Male',
                      'Female',
                    ],
                    value: 'Male',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
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
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            title('Group Type'),
            const SizedBox(
              width: 20.0,
            ),
            ConsoleDropdown(
              label: 'Group Type',
              options: const [
                'Group',
                'Single',
              ],
              value: 'Group',
              onChanged: (value) {
                // TODO: change field
              },
            ),
            title('Contact Details'),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: phoneController,
                    hintText: 'Phone',
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
                    controller: emailController,
                    hintText: 'Email Address',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidEmail(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: addressController,
                    hintText: 'Address',
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
                    controller: socHandleController,
                    hintText: 'Social Handle',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            title('Principal Designation'),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: rankController,
                    hintText: 'Rank',
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
                    controller: positionController,
                    hintText: 'Position',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: garrisonController,
                    hintText: 'Garrison',
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
                    controller: divisionController,
                    hintText: 'Division',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: platoonController,
                    hintText: 'Platoon',
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
                    controller: unitController,
                    hintText: 'Unit',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            FlatTextField(
              controller: primAssController,
              hintText: 'Place of Primary Assignment',
              isPassword: false,
              validationService: (String? name) =>
                  ValidationService.isValidInput(name!),
            ),
            title('Account Tier'),
            ConsoleDropdown(
              label: 'Account Tier',
              options: const [
                'Class 1',
                'Class 2',
                'Class 3',
                'Class 4',
                'Class 5',
                'Class 6',
                'Class 7',
                'Class 8',
                'Class 9',
                'Class 10',
              ],
              value: 'Class 1',
              onChanged: (value) {
                // TODO: change field
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => showEmpty(text: 'No biometric device attached'),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey, width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          CupertinoIcons.check_mark,
                          color: Colors.green,
                          size: 50,
                        ),
                        Container(
                          height: 100,
                          color: Colors.grey,
                          width: 1,
                        ),
                        Image.asset(
                          './assets/images/fingerprint1.jpg',
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                )),
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
                    ConsoleState.state.patientToEdit = null;
                    selectedItem.value = CurrentSelectedNavItem.dashboard;
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
                    if (!_formKey.currentState!.validate()) return;

                    setState(() {
                      loading = true;
                    });

                    Map payload = {
                      'phone': phoneController.text,
                      'groupType': 'Single',
                      'accountTier': 'Class 1',
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'height': heightController.text,
                      'weight': weightController.text,
                      'age': ageController.text,
                      'bloodGroup': 'A+',
                      'genotype': 'AA',
                      'bmi': 'None',
                      'photograph': 'None',
                      'sex': 'Male',
                      'email': emailController.text,
                      'address': addressController.text,
                      'garrison': garrisonController.text,
                      'position': positionController.text,
                      'primaryAss': primAssController.text,
                      'rank': rankController.text,
                      'socHandle': socHandleController.text,
                      'unit': unitController.text,
                      'platoon': platoonController.text,
                      'division': divisionController.text,
                    };

                    await registerPatient(payload);
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

  void _select() {
    showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SizedBox(
                height: 0.15.sh,
                width: 0.25.sw,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              CupertinoIcons.selection_pin_in_out,
                              size: 0.04.sw,
                            ),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            FlatButton(
                              buttonText: 'Pick Image',
                              onTap: _pickImage,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 0.04.sw,
                            ),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            FlatButton(
                                buttonText: 'User Camera',
                                onTap: () {
                                  Get.back();
                                  _initializeCamera();
                                  // _fetchCameras();
                                }),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))));
        });
  }

  Future<void> _fetchCameras() async {
    String cameraInfo;
    List<CameraDescription> cameras = <CameraDescription>[];

    int cameraIndex = 0;
    try {
      cameras = await CameraPlatform.instance.availableCameras();

      if (cameras.isEmpty) {
        cameraInfo = 'No available cameras';
      } else {
        cameraIndex = _cameraIndex % cameras.length;
        cameraInfo = 'Found camera: ${cameras[cameraIndex].name}';
      }
    } on PlatformException catch (e) {
      print('platform exc');
      cameraInfo = 'Failed to get cameras: ${e.code}: ${e.message}';
    }

    if (mounted) {
      setState(() {
        _cameraIndex = cameraIndex;
        _cameras = cameras;
        _cameraInfo = cameraInfo;
      });
    }
  }

  Future<void> _initializeCamera() async {
    assert(!_initialized);

    if (_cameras.isEmpty) {
      return;
    }

    int cameraId = -1;
    try {
      final int cameraIndex = _cameraIndex % _cameras.length;
      final CameraDescription camera = _cameras[cameraIndex];

      cameraId = await CameraPlatform.instance.createCamera(
        camera,
        _resolutionPreset,
      );

      _errorStreamSubscription?.cancel();
      _errorStreamSubscription = CameraPlatform.instance
          .onCameraError(cameraId)
          .listen((_onCameraError));

      _cameraClosingStreamSubscription?.cancel();
      _cameraClosingStreamSubscription = CameraPlatform.instance
          .onCameraClosing(cameraId)
          .listen(_onCameraClosing);

      final Future<CameraInitializedEvent> initialized =
          CameraPlatform.instance.onCameraInitialized(cameraId).first;

      await CameraPlatform.instance.initializeCamera(
        cameraId,
      );

      final CameraInitializedEvent event = await initialized;
      _previewSize = Size(
        event.previewWidth,
        event.previewHeight,
      );

      if (mounted) {
        setState(() {
          _initialized = true;
          _cameraId = cameraId;
          _cameraIndex = cameraIndex;
          _cameraInfo = 'Capturing camera: ${camera.name}';
        });
      }
    } on CameraException catch (e) {
      try {
        if (cameraId >= 0) {
          await CameraPlatform.instance.dispose(cameraId);
        }
      } on CameraException catch (e) {
        debugPrint('Failed to dispose camera: ${e.code}: ${e.description}');
      }

      // Reset state.
      if (mounted) {
        setState(() {
          _initialized = false;
          _cameraId = -1;
          _cameraIndex = 0;
          _previewSize = null;
          _cameraInfo =
              'Failed to initialize camera: ${e.code}: ${e.description}';
        });
      }
    }
  }

  void _onCameraError(CameraErrorEvent event) {
    if (mounted) {
      // Dispose camera on camera error as it can not be used anymore.
      _disposeCurrentCamera();
      _fetchCameras();
    }
  }

  void _onCameraClosing(CameraClosingEvent event) {
    if (mounted) {}
  }

  Future<void> _disposeCurrentCamera() async {
    if (_cameraId >= 0 && _initialized) {
      try {
        await CameraPlatform.instance.dispose(_cameraId);

        if (mounted) {
          setState(() {
            _initialized = false;
            _cameraId = -1;
            _previewSize = null;
            _previewPaused = false;
            _cameraInfo = 'Camera disposed';
          });
        }
      } on CameraException catch (e) {
        if (mounted) {
          setState(() {
            _cameraInfo =
                'Failed to dispose camera: ${e.code}: ${e.description}';
          });
        }
      }
    }
  }

  Widget _buildPreview() {
    return CameraPlatform.instance.buildPreview(_cameraId);
  }

  Future<void> _takePicture() async {
    final XFile file = await CameraPlatform.instance.takePicture(_cameraId);
    _image = File(file.path);

    _disposeCurrentCamera();

    setState(() {
      // rebuild
    });
  }

  void _pickImage() async {
    Get.back(); // pop dialog
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _image = File(result.paths.single.toString());
      });
    } else {}
  }
}
