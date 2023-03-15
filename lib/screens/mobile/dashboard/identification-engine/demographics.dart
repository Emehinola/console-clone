import 'package:console/widgets/mobile/app-bar.dart';
import 'package:console/widgets/sheets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';

class Demography extends StatefulWidget {
  const Demography({Key? key}) : super(key: key);

  @override
  State<Demography> createState() => _PatientsListState();
}

class _PatientsListState extends State<Demography> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Demographics'),
      backgroundColor: ColorPalette.cardGrey,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        // BoxShadow(
                        //   color: ColorPalette.shadowColor,
                        //   offset: Offset(0, -5),
                        //   blurRadius: 5,
                        //   spreadRadius: 0.2,
                        //   blurStyle: BlurStyle.outer,
                        // )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0.sp),
                        topRight: Radius.circular(25.0.sp),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          FlatTextField(
                            hintText: 'Search by parameter',
                            suffixIcon: CupertinoIcons.search,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: ConsoleIconButton(
                                icon: IconlyLight.filter,
                                text: 'Filter',
                              )),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: ConsoleIconButton(
                                  icon: Icons.filter_list,
                                  text: 'Sort',
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          PatientDemography(
                            status: "Completed",
                            onTap: () {
                              showScheduleSheet(context);
                            },
                          ),
                          PatientDemography(
                            status: "Incomplete",
                            onTap: () {},
                          ),
                          PatientDemography(
                            status: "Completed",
                            onTap: () {
                              showScheduleSheet(context);
                            },
                          ),
                          PatientDemography(
                            status: "Incomplete",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}