import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
                expandedHeight: 300,
                backgroundColor: Colors.white,
                leading: Container(
                  padding: const EdgeInsets.all(2.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          color: ColorPalette.mainButtonColor.withOpacity(0.3))
                    ],
                  ),
                  child: const Icon(
                    FontAwesomeIcons.bars,
                    color: ColorPalette.mainButtonColor,
                  ),
                ),
                actions: [
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
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
                      FontAwesomeIcons.user,
                      color: ColorPalette.mainButtonColor,
                    ),
                  ),
                ],
                snap: false,
                floating: false,
                pinned: true,
                toolbarHeight: kToolbarHeight,
                collapsedHeight: 60,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  expandedTitleScale: 4,
                  titlePadding: EdgeInsets.zero,
                  title: ListTile(
                    leading: Image.asset(
                      './assets/images/male_avatar.png',
                      height: 30,
                    ),
                    title: const Text(
                      'Emehinola Samuel',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ),
                  background: Container(
                    color: Colors.red,
                  ),
                ),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (_, index) => const ListTile(
                      title: Text('Big Sam'),
                      subtitle: Text('My name'),
                      leading: Icon(FontAwesomeIcons.user),
                    ),
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
