import 'dart:io';

import 'package:console/database/provider.dart';
import 'package:console/screens/desktop/print/pat-reg.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import '../../../widgets/desktop/dialogs.dart';
import '../../../widgets/desktop/patient-list-tiles.dart';
import '../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../widgets/mob-desk/theme/color-palette.dart';
import '../print/engagement.dart';

class DesktopDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderMetrics(isUser: true),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        Expanded(
          child: DesktopPatienntCard(
            status: "Complete",
          ),
        ),
      ],
    );
  }
}

class HeaderMetrics extends StatelessWidget {
  bool isUser;
  bool isEngagement;
  bool isReg;

  HeaderMetrics(
      {Key? key,
      this.isUser = false,
      this.isEngagement = false,
      this.isReg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.01.sh, left: 0.017.sw, right: 0.01.sw),
      height: 0.17.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        selectedItem.value = CurrentSelectedNavItem.dashboard,
                    child: Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.mainButtonColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 0.15.sh,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('./assets/images/wave.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    './assets/images/new-graph.png',
                                    height: 0.04.sh,
                                  ),
                                  Text(
                                    'Total ${isUser ? 'Users' : 'Patients'}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        IconlyBold.user_2,
                                        color: ColorPalette.secondColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        isUser
                                            ? '${DBProvider.db.getAllUsers().length}'
                                            : '${DBProvider.db.getAllPatients().length}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (!isUser)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildFigureCard("Fully", "Registered",
                            figure: isUser
                                ? '${DBProvider.db.getAllUsers().length}'
                                : '${DBProvider.db.getAllPatients().length}',
                            isRegistered: true,
                            isUser: isUser),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        buildFigureCard("Not Fully", "Registered",
                            figure: '0',
                            color: ColorPalette.lightRed,
                            isRegistered: false,
                            isUser: isUser),
                      ],
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            width: 0.03.sw,
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: FlatTextField(
                          hintText: 'Search by parameter',
                          suffixIcon: CupertinoIcons.search,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: 0.07.sh,
                          child: FlatButton(
                            buttonText: 'Search',
                            horPaddding: 0.02.sw,
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 0.01.sw,
                              ),
                              GestureDetector(
                                onTap: () => showFilterDialog(),
                                child: DesktopConsoleIconButton(
                                  icon: IconlyLight.filter,
                                  text: 'Filter/Sort',
                                ),
                              ),
                              if (isEngagement || isReg)
                                SizedBox(
                                  width: 0.01.sw,
                                ),
                              if (isEngagement || isReg)
                                DesktopConsoleIconButton(
                                  icon: Icons.print,
                                  text: 'Print',
                                  onTap: () {
                                    showPrintType(isEngagement ? 'engagements.pdf' : 'patients-reg.pdf');
                                    // printEngagement();
                                    // File? file = isReg ? await generatePatientsReg(PdfPageFormat.a4) :  await generateEngagementPdf(PdfPageFormat.a4);
                                    // final Directory tempDir = await getApplicationDocumentsDirectory();
                                    //  showPathDialog(Platform.isMacOS ? '$tempDir/${file.path}' : file.path);
                                  },
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 0.017.sh,
                          )
                        ],
                      )
                    ],
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

Widget buildFigureCard(String text, String subText,
    {String figure = "",
    Color color = ColorPalette.lightGreen,
    bool isRegistered = false,
    bool isUser = false,
    Function()? onTap}) {
  return GestureDetector(
    onTap: () {
      if (onTap != null) {
        onTap();
        return;
      }
      if (isUser) {
        if (isRegistered) {
          ConsoleState.state.isUserRegistered.value = true;
        } else {
          ConsoleState.state.isUserRegistered.value = false;
        }
      } else {
        if (isRegistered) {
          ConsoleState.state.regViewText.value =
              "Registered ${isUser ? 'Users' : 'Patients'} (Complete)";
        } else {
          ConsoleState.state.regViewText.value =
              "Registered ${isUser ? 'Users' : 'Patients'} (Incomplete)";
        }
        selectedItem.value = CurrentSelectedNavItem.patientReg;
      }
    },
    child: Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
      height: 0.065.sh,
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorPalette.mainButtonColor,
                borderRadius: BorderRadius.circular(8.0)),
            padding: EdgeInsets.symmetric(horizontal: 0.005.sw),
            child: Text(
              figure,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                ),
              ),
              Text(
                subText,
                style: TextStyle(color: ColorPalette.grey, fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
