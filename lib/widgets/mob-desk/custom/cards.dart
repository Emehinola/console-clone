import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

Widget metricCard(String title, String value,
    {Color valueColor = ColorPalette.mainButtonColor,
    bool active = false,
    Function()? onTap}) {
  return InkWell(
    onTap: () {
      if (onTap != null) onTap();
    },
    child: AnimatedContainer(
      height: active ? 100 : 80,
      width: active ? 100 : 80,
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 3),
            color: ColorPalette.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: valueColor),
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ))
        ],
      ),
    ),
  );
}

class PatientCard extends StatelessWidget {
  String status;

  PatientCard({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ColorPalette.grey.withOpacity(0.05),
                offset: const Offset(2, 3),
                spreadRadius: 0.1,
                blurRadius: 2)
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

Widget rowCard(String title, String text, {bool hasBg = true}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
    decoration: BoxDecoration(
        color:
            hasBg ? ColorPalette.secondColor.withOpacity(0.04) : Colors.white,
        borderRadius: BorderRadius.circular(3.0)),
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
