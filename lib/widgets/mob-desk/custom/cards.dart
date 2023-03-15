import 'package:flutter/material.dart';

Widget metricCard(String title, String value) {
  return Container(
    height: 80,
    width: 80,
    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.2)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(title, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5)),)
      ],
    ),
  );
}
