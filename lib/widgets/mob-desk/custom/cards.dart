import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

class PatientCard extends StatelessWidget {
  String status;

  PatientCard({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        // BoxShadow(
        //     color: ColorPalette.grey.withOpacity(0.05),
        //     offset: const Offset(2, 3),
        //     spreadRadius: 0.1,
        //     blurRadius: 2)
      ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        IconlyBold.user_2,
                        color: ColorPalette.greyIcon,
                      ),
                      Text(
                        "QH29",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const Text(
                    "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.darkBlue),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: status == "Complete"
                            ? ColorPalette.lightGreen
                            : ColorPalette.lightRed),
                    child: Text(
                      status,
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              status == "Complete" ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Icon(
                    CupertinoIcons.chevron_right,
                    size: 15,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          rowCard("Patient", "Emehinola Samuel"),
          rowCard("Group Type", "Individual", hasBg: false),
          rowCard("Contact", "+2348131615393"),
          rowCard("Account Tier", "Tier 3", hasBg: false),
          rowCard("Address", "8, olawole close, etegbin, Lagos"),
        ],
      ),
    );
  }
}

class DesktopPatienntCard extends StatelessWidget {
  String status;

  DesktopPatienntCard({
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
            height: 50,
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
          ListView(
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
        ],
      ),
    );
  }
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
      Text(text, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Colors.grey),),
      const SizedBox(
        width: 7.0,
      ),
      createdArrowUpDown(),
    ],
  );
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
              Text(id, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.offBlack),),
            ],
          ),
          Text(date, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.grey),),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.grey),),
          Text(groupType, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.grey),),
          Text(contact, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.grey),),
          Text(acctTier, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.grey),),
          Text(address, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: ColorPalette.grey),),
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

class SchedulePatientCard extends StatelessWidget {
  String status;
  Function()? onTap;

  SchedulePatientCard({
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          // BoxShadow(
          //     color: ColorPalette.grey.withOpacity(0.05),
          //     offset: const Offset(2, 3),
          //     spreadRadius: 0.1,
          //     blurRadius: 2)
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          "ID: QH29",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Scheduled"
                              ? ColorPalette.lightMain
                              : ColorPalette.lighterSecond),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12,
                            color: status == "Scheduled"
                                ? ColorPalette.mainButtonColor
                                : ColorPalette.secondColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel", fromSchedule: true),
            rowCard("Case", "Individual", hasBg: false),
            rowCard("Appointment Date", "23rd, Mar, 23", fromSchedule: true),
          ],
        ),
      ),
    );
  }
}

class PatientDemography extends StatelessWidget {
  String status;
  Function()? onTap;

  PatientDemography({
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              // BoxShadow(
              //     color: ColorPalette.grey.withOpacity(0.05),
              //     offset: const Offset(2, 3),
              //     spreadRadius: 0.1,
              //     blurRadius: 2)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          "ID: QH29",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Completed"
                              ? ColorPalette.lightGreen
                              : ColorPalette.lightRed),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12,
                            color: status == "Completed"
                                ? ColorPalette.checkGreen
                                : ColorPalette.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel", fromSchedule: false),
            rowCard("State", "Lagos State", hasBg: false),
            rowCard("LGA", "Kosofe LGA", fromSchedule: false),
            rowCard("Facility", "Hospital", hasBg: false),
          ],
        ),
      ),
    );
  }
}

class PatientIdentification extends StatelessWidget {
  String status;
  Function()? onTap;

  PatientIdentification({
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              // BoxShadow(
              //     color: ColorPalette.grey.withOpacity(0.05),
              //     offset: const Offset(2, 3),
              //     spreadRadius: 0.1,
              //     blurRadius: 2)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          "USER ID: QH29",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Completed"
                              ? ColorPalette.lightGreen
                              : ColorPalette.lightRed),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12,
                            color: status == "Completed"
                                ? ColorPalette.checkGreen
                                : ColorPalette.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel", fromSchedule: false),
            rowCard("Group ID", "#324355", hasBg: false),
            rowCard("Medical Class", "Family Group", fromSchedule: false),
          ],
        ),
      ),
    );
  }
}

Widget rowCard(String title, String text,
    {bool hasBg = true, fromSchedule = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
    decoration: BoxDecoration(
        color: hasBg
            ? (fromSchedule
                ? ColorPalette.mainButtonColor.withOpacity(0.04)
                : ColorPalette.secondColor.withOpacity(0.04))
            : Colors.white,
        borderRadius: BorderRadius.circular(1.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        Text(
          text,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ],
    ),
  );
}
