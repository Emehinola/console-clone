import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../widgets/mob-desk/custom/cards.dart';
import '../../../widgets/mobile/table.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 60,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.line_horizontal_3_decrease,
                    color: ColorPalette.mainButtonColor,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyBold.user_2,
                      color: ColorPalette.mainButtonColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
                snap: false,
                floating: false,
                pinned: true,
                toolbarHeight: kToolbarHeight,
                collapsedHeight: 70,
                // flexibleSpace: FlexibleSpaceBar(
                //   centerTitle: false,
                //   title: ListTile(
                //     leading: Image.asset(
                //       './assets/images/male_avatar.png',
                //       height: 30,
                //     ),
                //     title: const Text(
                //       'Emehinola Samuel',
                //       style: TextStyle(
                //           fontSize: 13,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.red),
                //     ),
                //   ),
                // ),
                bottom: PreferredSize(
                    preferredSize: Size(Get.width, 150),
                    child: Container(
                      height: 150,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: ColorPalette.mainButtonColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0.sp),
                          topRight: Radius.circular(20.0.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          metricCard("Users", "10"),
                          metricCard("Fully Registered", "15"),
                          metricCard("Half Registered", "23"),
                        ],
                      ),
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0.sp),
                      topRight: Radius.circular(20.0.sp),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Text('table')
                      )
                    ],
                  ),
                ),
              ),
            ],
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
    );
  }
}
