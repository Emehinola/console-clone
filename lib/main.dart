import 'package:console/screens/mobile/onboarding/platform-selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
  // await testWindowFunctions();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1314, 1022),
        // mac 1680, 1050
        minTextAdapt: true,
        splitScreenMode: true,
        scaleByHeight: false,
        rebuildFactor: (_, widget){
          return true;
        },
        builder: (context, child) {
          // ScreenUtil.init(context);
          return GetMaterialApp(
            title: 'Console',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Roobert',
            ),
            home: const SelectWelcomeScreen(),
          );
        });
  }
}
//
// Future testWindowFunctions() async {
//   Size size = await DesktopWindow.getWindowSize();
//   print(size);
//   await DesktopWindow.setWindowSize(size);
//
//   await DesktopWindow.setMinWindowSize(size);
//   await DesktopWindow.setMaxWindowSize(size);
//
//   // await DesktopWindow.resetMaxWindowSize();
//   // await DesktopWindow.toggleFullScreen();
//   // bool isFullScreen = await DesktopWindow.getFullScreen();
//   // await DesktopWindow.setFullScreen(true);
//   // await DesktopWindow.setFullScreen(false);
// }