import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../widgets/mob-desk/buttons/shadow-btns.dart';
import '../../../widgets/mob-desk/custom/cards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<bool> activeList = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          height: Get.height,
          width: 200,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShadowIconButton(iconData: Icons.sort, onTap: () => Scaffold.of(context).openDrawer(),),
                  ShadowIconButton(iconData: CupertinoIcons.person_alt),
                ],
              ),
            ),
            SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          metricCard("Users", "10", active: activeList[0],
                              onTap: () {
                            setState(() {
                              activeList[0] = true;
                              activeList[1] = false;
                              activeList[2] = false;
                            });
                          }),
                          metricCard("Fully Registered", "15",
                              valueColor: ColorPalette.secondColor,
                              active: activeList[1], onTap: () {
                            setState(() {
                              activeList[1] = true;
                              activeList[2] = false;
                              activeList[0] = false;
                            });
                          }),
                          metricCard("Half Registered", "23",
                              valueColor: ColorPalette.red,
                              active: activeList[2], onTap: () {
                            setState(() {
                              activeList[2] = true;
                              activeList[1] = false;
                              activeList[0] = false;
                            });
                          }),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height,
                      width: Get.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: ColorPalette.shadowColor,
                            offset: Offset(0, -5),
                            blurRadius: 5,
                            spreadRadius: 0.2,
                            blurStyle: BlurStyle.outer,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0.sp),
                          topRight: Radius.circular(25.0.sp),
                        ),
                      ),
                      child: Column(
                        children: [
                          ConsoleTextField2(
                            hintText: 'Search by parameters',
                            suffixCallBack: () {},
                            topMargin: 5,
                            suffixIcon: CupertinoIcons.search,
                          ),
                          const SizedBox(
                            height: 20,
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
                          PatientCard(
                            status: "Complete",
                          ),
                          PatientCard(
                            status: "Incomplete",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                crossFadeState: CrossFadeState.showFirst,
                secondChild: const SizedBox.shrink(),
                firstCurve: Curves.slowMiddle,
                firstChild: SizedBox(
                  height: 100,
                  width: Get.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorPalette.mainButtonColor,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              color:
                                  ColorPalette.mainButtonColor.withOpacity(0.3))
                        ],
                      ),
                      child: const Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
