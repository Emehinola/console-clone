import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/screens/mobile/dashboard/dashboard.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/sucess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mob-desk/custom/cards.dart';
import 'mob-desk/theme/color-palette.dart';

void showScheduleSheet(BuildContext context) {
  DateTime dt = DateTime.now();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    constraints: BoxConstraints(
        maxHeight: Get.height * 0.9, minHeight: Get.height * 0.6),
    isScrollControlled: true,
    builder: (context) {
      return Container(
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
                color: ColorPalette.mainButtonColor,
              ),
              child: const Text(
                'Patient Scheduler',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                    SchedulePatientCard(
                      status: 'Schedule',
                    ),
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.single,
                      ),
                      onValueChanged: (dates) {},
                      initialValue: [],
                    ),
                    ConsoleTextButton(
                      buttonText: 'Commit',
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(
                          DisplaySuccess(
                            title: 'Schedule submitted',
                            description: 'Your schedule has been submitted!',
                            nextText: 'Go to Dashboard',
                            onNext: ()=> navigate(const Dashboard()),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
