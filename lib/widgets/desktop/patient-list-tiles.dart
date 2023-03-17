import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../mob-desk/theme/color-palette.dart';

class DesktopPatienntCard extends StatelessWidget {
  String status;

  DesktopPatienntCard({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'DATE CREATED'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'GROUP TYPE'),
                buildRowItem(text: 'CONTACT'),
                buildRowItem(text: 'ACCOUNT TIER'),
                buildRowItem(text: 'ADDRESS'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),
                buildRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos"),
                buildRowContent(hasBg: false, date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupType: "Family group", acctTier: "Tier 1", contact: "+2348131615393", address: "8, Expressway, Lagos",),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DemographicsTable extends StatelessWidget {
  String status;

  DemographicsTable({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'DATE CREATED'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'STATE'),
                buildRowItem(text: 'LGA AREA'),
                buildRowItem(text: 'FACILITY'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
                buildDemographyRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", facility: "My facility", state: "Lagos state", lga: "Apapa LGA",),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IdentificationTable extends StatelessWidget {
  String status;

  IdentificationTable({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'DATE CREATED'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'GROUP ID'),
                buildRowItem(text: 'MEDICAL CLASS'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),
                buildIdentificationRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", groupId: '#675768'),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopPatienntScheduleTable extends StatelessWidget {
  String status;

  DesktopPatienntScheduleTable({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'CASE'),
                buildRowItem(text: 'APPOINTMENT DATE'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),
                buildScheduleRowContent(hasBg: false,date: "23 Jun, 2023", name: 'Emehinola Sam', id: "Q929", caseType: "Family group",),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildRowContent({hasBg = true, String id = "", String name = "", String date = "", String groupType = "", String contact = "", String acctTier = "", String address = ""}){
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                  ),
                  const Icon(CupertinoIcons.person_solid, size: 15, color: Colors.grey,),
                ],
              ),
              const SizedBox(
                width: 7.0,
              ),
              Text(id, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.offBlack),),
            ],
          ),
          Text(date, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.grey),),
          Text(name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.grey),),
          Text(groupType, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.grey),),
          Text(contact, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.grey),),
          Text(acctTier, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.grey),),
          Text(address, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: ColorPalette.grey),),
        ],
      ),
    ),
  );
}

Widget buildScheduleRowContent({hasBg = true, String id = "", String name = "", String date = "", String caseType = "",}){
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                  ),
                  const Icon(CupertinoIcons.person_solid, size: 15, color: Colors.grey,),
                ],
              ),
              const SizedBox(
                width: 7.0,
              ),
              Text(id, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.offBlack),),
            ],
          ),
          Text(name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(caseType, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(date, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
        ],
      ),
    ),
  );
}

Widget buildDemographyRowContent({hasBg = true, String id = "", String name = "", String date = "", String state = "",String lga = "",String facility = "",}){
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                  ),
                  const Icon(CupertinoIcons.person_solid, size: 15, color: Colors.grey,),
                ],
              ),
              const SizedBox(
                width: 7.0,
              ),
              Text(id, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.offBlack),),
            ],
          ),
          Text(date, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(state, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(lga, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(facility, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
        ],
      ),
    ),
  );
}

Widget buildIdentificationRowContent({hasBg = true, String id = "", String name = "", String groupId = "", String date = ""}){
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                  ),
                  const Icon(CupertinoIcons.person_solid, size: 15, color: Colors.grey,),
                ],
              ),
              const SizedBox(
                width: 7.0,
              ),
              Text(id, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.offBlack),),
            ],
          ),
          Text(date, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text(groupId, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
          Text('Individual', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: ColorPalette.grey),),
        ],
      ),
    ),
  );
}

Widget createdArrowUpDown(){
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(FontAwesomeIcons.caretDown, size: 10, color: ColorPalette.offBlack,),
        Icon(FontAwesomeIcons.caretUp, size: 10, color: Colors.grey),
      ],
    ),
  );
}


Widget buildRowItem({bool hasBox = false, String text = ""}){
  return Row(
    children: [
      if(hasBox)  Checkbox(
        value: false,
        onChanged: (value) {},
        side: const BorderSide(
          color: Colors.grey,
        ),
        fillColor: MaterialStateProperty.resolveWith(
                (states) => Colors.white),
      ),
      if(hasBox) const SizedBox(
        width: 7.0,
      ),
      Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp, color: Colors.grey),),
      const SizedBox(
        width: 7.0,
      ),
      createdArrowUpDown(),
    ],
  );
}