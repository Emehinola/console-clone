import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../widgets/mob-desk/custom/cards.dart';
import '../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../widgets/mob-desk/theme/color-palette.dart';

class DesktopDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderMetrics(),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                width: Get.width,
                // padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    DesktopPatienntCard(
                      status: "Complete",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderMetrics extends StatelessWidget {
  const HeaderMetrics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 60.0, right: 60.0),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorPalette.mainButtonColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      height: 130,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      './assets/images/wave.png'),
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
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  './assets/images/new-graph.png',
                                  height: 50,
                                ),
                                const Text(
                                  'Total Users',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      IconlyBold.user_2,
                                      color: ColorPalette.secondColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '23',
                                      style: TextStyle(
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
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.lightGreen,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 50,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorPalette.mainButtonColor,
                                  borderRadius:
                                  BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                '45',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Fully',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Registered',
                                  style: TextStyle(
                                      color: ColorPalette.grey,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.lightRed,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 50,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorPalette.mainButtonColor,
                                  borderRadius:
                                  BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                '13',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Not Fully',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Registered',
                                  style: TextStyle(
                                      color: ColorPalette.grey,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 50.0,
          ),
          Expanded(
              flex: 3,
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
                  const SizedBox(
                    width: 50.0,
                  ),
                  DesktopConsoleIconButton(
                    icon: IconlyLight.filter,
                    text: 'Filter',
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  DesktopConsoleIconButton(
                    icon: Icons.filter_list,
                    text: 'Sort',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

