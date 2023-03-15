import 'package:flutter/material.dart';
import '../theme/color-palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class ConsoleTextField extends StatelessWidget {
  String? hintText;
  bool obscure;
  bool isPassword;
  bool editable;
  int? maxInput;
  int? minInput;
  TextInputType? inputType;
  TextEditingController? controller;
  String? Function(String?)? validationService;
  Function()? suffixCallBack;
  Function()? onTap;
  Widget? suffix;
  double topMargin;

  ConsoleTextField({
    this.controller,
    this.editable = true,
    this.inputType,
    this.maxInput,
    this.minInput,
    this.hintText,
    this.obscure = false,
    this.isPassword = false,
    this.suffixCallBack,
    this.onTap,
    this.validationService,
    this.suffix,
    this.topMargin = 20,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        margin: EdgeInsets.only(top: topMargin, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(2,3),
                  color: ColorPalette.grey.withOpacity(0.05),
                  blurRadius: 2,
                  spreadRadius: 1
              )
            ],
            borderRadius: BorderRadius.circular(8.0.sp)
        ),
        child: TextFormField(
          controller: controller,
          validator: validationService,
          obscureText: obscure,
          keyboardType: inputType,
          obscuringCharacter: '•',
          maxLength: maxInput,
          enabled: editable,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: isPassword && obscure ? 1.5 : 1.0),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            hintStyle: TextStyle(
                color: ColorPalette.hintTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0.sp),
            disabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            border: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(16.0),
            ),focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            suffix: suffix,
            counter: null,
            counterText: '',
            suffixIcon: isPassword
                ? GestureDetector(
              onTap: suffixCallBack,
              child: Icon(
                obscure ? IconlyBold.hide : IconlyBold.show,
                size: 25,
                color: !obscure
                    ? ColorPalette.mainButtonColor
                    : Colors.black,
              ),
            )
                : null,
          ),
        ),
      ),
    );
  }
}

class ConsoleTextField2 extends StatelessWidget {
  String? hintText;
  bool obscure;
  bool isPassword;
  bool editable;
  int? maxInput;
  int? minInput;
  TextInputType? inputType;
  TextEditingController? controller;
  String? Function(String?)? validationService;
  Function()? suffixCallBack;
  Function()? onTap;
  Widget? suffix;
  IconData? suffixIcon;
  double topMargin;

  ConsoleTextField2({
    this.controller,
    this.editable = true,
    this.inputType,
    this.maxInput,
    this.minInput,
    this.hintText,
    this.obscure = false,
    this.isPassword = false,
    this.suffixCallBack,
    this.onTap,
    this.validationService,
    this.suffix,
    this.suffixIcon,
    this.topMargin = 30,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        margin: EdgeInsets.only(top: topMargin, left: 0, right: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1,2),
                  color: ColorPalette.mainButtonColor.withOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 2
              )
            ],
            borderRadius: BorderRadius.circular(20.0.sp)
        ),
        child: TextFormField(
          controller: controller,
          validator: validationService,
          obscureText: obscure,
          keyboardType: inputType,
          obscuringCharacter: '•',
          maxLength: maxInput,
          enabled: editable,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: isPassword && obscure ? 1.5 : 1.0),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            hintStyle: TextStyle(
                color: ColorPalette.hintTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0.sp),
            disabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(20.0),
            ),focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            suffix: suffix,
            counter: null,
            counterText: '',
            suffixIcon: GestureDetector(
              onTap: suffixCallBack,
              child: Icon(
                suffixIcon,
                size: 25,
                color: !obscure
                    ? ColorPalette.mainButtonColor
                    : Colors.black,
              ),
            )
                ,
          ),
        ),
      ),
    );
  }
}

class ConsoleTextBoxField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validationService;
  Function()? suffixCallBack;
  double topMargin;
  int minLines;
  int maxLines;

  ConsoleTextBoxField({
    this.controller,
    this.hintText,
    this.suffixCallBack,
    this.validationService,
    this.topMargin = 20,
    this.minLines = 5,
    this.maxLines = 6,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      margin: EdgeInsets.only(top: topMargin, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
          BoxShadow(offset: const Offset(2,3),
        color: ColorPalette.grey.withOpacity(0.05),
        blurRadius: 2,
        spreadRadius: 1
    )],
          borderRadius: BorderRadius.circular(8.0.sp)
      ),
      child: TextFormField(
        controller: controller,
        validator: validationService,
        minLines: minLines,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          hintStyle: TextStyle(
              color: ColorPalette.hintTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0.sp),
          focusedBorder: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          filled: true,
          fillColor: Colors.white,  //ColorPalette.textFieldBg,
        ),
      ),
    );
  }
}

class FlatTextField extends StatelessWidget {
  String hintText;
  bool obscure;
  bool isPassword;
  bool editable;
  int? maxInput;
  int? minInput;
  TextInputType? inputType;
  TextEditingController? controller;
  String? Function(String?)? validationService;
  Function()? suffixCallBack;
  Function()? onTap;
  Widget? suffix;
  IconData? suffixIcon;

  FlatTextField({
    this.controller,
    this.editable = true,
    this.inputType,
    this.maxInput,
    this.minInput,
    required this.hintText,
    this.obscure = false,
    this.isPassword = false,
    this.suffixCallBack,
    this.onTap,
    this.validationService,
    this.suffix,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        child: TextFormField(
          controller: controller,
          validator: validationService,
          obscureText: obscure,
          keyboardType: inputType,
          obscuringCharacter: '•',
          maxLength: maxInput,
          enabled: editable,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(16.sp),
              fontWeight: FontWeight.w600,
              letterSpacing: isPassword && obscure ? 1.5 : 1.0),
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(hintText!),
            hintStyle: TextStyle(
                color: ColorPalette.hintTextColor,
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(16.0)),
            disabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            border: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.transparent, width: 0.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            filled: true,
            fillColor: ColorPalette.textFieldBg,
            suffix: suffix,
            counter: null,
            counterText: '',
            suffixIcon: isPassword
                ? GestureDetector(
              onTap: suffixCallBack,
              child: Icon(
                obscure ? IconlyBold.hide : IconlyBold.show,
                size: 25,
                color: !obscure
                    ? ColorPalette.mainButtonColor
                    : Colors.black,
              ),
            ) : suffixIcon != null ? Icon(suffixIcon, size: 25,) :
                 null,
          ),
        ),
      ),
    );
  }
}

class FlatTextBoxField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validationService;
  Function()? suffixCallBack;

  FlatTextBoxField({
    this.controller,
    this.hintText,
    this.suffixCallBack,
    this.validationService,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    ScreenUtil.init(context, designSize: Size(screenWidth, screenHeight));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      child: TextFormField(
        controller: controller,
        validator: validationService,
        minLines: 5,
        maxLines: 6,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(16.0),
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: ColorPalette.hintTextColor,
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(16.0)),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          filled: true,
          fillColor: ColorPalette.textFieldBg,
        ),
      ),
    );
  }
}
