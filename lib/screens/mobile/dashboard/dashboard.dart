import 'package:console/screens/mobile/dashboard/practice-mgt/registration/patient-registration.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../widgets/mob-desk/custom/cards.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final _pageController = PageController(initialPage: 1, viewportFraction: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
          child: SideDrawer(
        pageController: _pageController,
      )),
      body: Builder(builder: (context) {
        return SafeArea(child: MainDashboard());
      }),
    );
  }
}

class MainDashboard extends StatefulWidget {
  MainDashboard({
    Key? key,
  }) : super(key: key);

  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  List<bool> activeList = [true, false, false];

  final scrollController = ScrollController();
  bool hideFab = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.axisDirection == AxisDirection.up) {
        setState(() {
          hideFab = true;
        });
      } else {
        setState(() {
          hideFab = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                    constraints: const BoxConstraints(
                      maxHeight: 35,
                    )),
                const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      CupertinoIcons.person_alt,
                      color: Colors.white,
                    ),
                    constraints: const BoxConstraints(
                      maxHeight: 35,
                    )),
                // ShadowIconButton(
                //   iconData: Icons.sort,
                //   onTap: () {
                //     Scaffold.of(context).openDrawer();
                //   },
                // ),
                // ShadowIconButton(iconData: CupertinoIcons.person_alt),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  image: AssetImage('./assets/images/wave.png'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  borderRadius: BorderRadius.circular(8.0)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      color: ColorPalette.grey, fontSize: 10),
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
                                  borderRadius: BorderRadius.circular(8.0)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      color: ColorPalette.grey, fontSize: 10),
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
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: Get.width,
                    // padding: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: ColorPalette.grey.withOpacity(0.01),
                      boxShadow: const [
                        BoxShadow(
                          color: ColorPalette.shadowColor,
                          offset: Offset(0, -3),
                          blurRadius: 2,
                          spreadRadius: 0.1,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0.sp),
                        topRight: Radius.circular(30.0.sp),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 5),
                            child: Column(
                              children: [
                                FlatTextField(
                                    hintText: 'Search by parameter',
                                    suffixIcon: CupertinoIcons.search,
                                    fillColor: Colors.white),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                              ],
                            ),
                          ),
                          const Divider(),
                          PatientCard(
                            status: "Complete",
                          ),
                          PatientCard(
                            status: "Incomplete",
                          ),
                          PatientCard(
                            status: "Incomplete",
                          ),
                          PatientCard(
                            status: "Complete",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        crossFadeState:
            hideFab ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        secondChild: const SizedBox.shrink(),
        firstCurve: Curves.slowMiddle,
        firstChild: GestureDetector(
          onTap: () => navigate(const PatientRegistration(),
              routeName: '/register-patient'),
          child: SizedBox(
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
                        color: ColorPalette.mainButtonColor.withOpacity(0.3))
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
    );
  }
}
