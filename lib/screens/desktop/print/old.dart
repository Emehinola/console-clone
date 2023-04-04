import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../database/provider.dart';
import '../../../models/patient-schedule.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<File> generateResume(PdfPageFormat format) async {
  final doc = pw.Document(title: 'Engagement', author: 'Big Sam');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/images/console.jpeg')).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.Page(
      // margin: pw.EdgeInsets.zero,
      // pageFormat: PdfPageFormat.a4,
        pageTheme: pageTheme,
        build: (pw.Context context) => _EngagementTableState()
    ),
  );

  final file = File("engagement.pdf");
  return await file.writeAsBytes(await doc.save());

  // return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {

  final bg = pw.MemoryImage(
    (await rootBundle.load('assets/images/smiling.jpg')).buffer.asUint8List(),
  );

  format = format.applyMargin(
    left: 0, // 2.0 * PdfPageFormat.cm,
    top:  0, //4.0 * PdfPageFormat.cm,
    right: 0, // 2.0 * PdfPageFormat.cm,
    bottom: 0, // 2.0 * PdfPageFormat.cm);
  );
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      // base: await PdfGoogleFonts.openSansRegular(),
      // bold: await PdfGoogleFonts.openSansBold(),
      // icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.Image(bg),
              left: 0,
              top: 0,
            ),
            // pw.Positioned(
            //   child: pw.Transform.rotate(
            //       angle: pi, child: pw.Image(bgShape)),
            //   right: 0,
            //   bottom: 0,
            // ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    this.icon,
  });

  final String title;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _EngagementTableState extends pw.StatelessWidget {
  // Uint8List bytes = base64Decode('assets/images/smiling.jpg');

  @override
  pw.Widget build(pw.Context context) {
    return  pw.Column(
      children: <pw.Widget>[
        pw.Container(
          height: 0.05.sh,
          padding: const pw.EdgeInsets.symmetric(horizontal: 0.0),
          color: const PdfColor(110/255, 113/255, 145/255, 0.1),
          width: double.infinity,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _buildRowItem(hasBox: false, text: 'ID', engagement: true),
              _buildRowItem(text: 'NAME', engagement: true),
              _buildRowItem(text: 'TEMPERATURE', engagement: true),
              _buildRowItem(text: 'PULSE', engagement: true),
              _buildRowItem(text: 'UPP. BLOOD PRES', engagement: true),
              _buildRowItem(text: 'LOW. BLOOD PRES.', engagement: true),
              _buildRowItem(text: 'OXY. SAT', engagement: true),
              _buildRowItem(text: 'RESP. RATE', engagement: true),
              _buildRowItem(text: 'HEIGHT(cm)', engagement: true),
              _buildRowItem(text: 'WEIGHT(kg)', engagement: true),
              _buildRowItem(text: 'FILE', engagement: true),
            ],
          ),
        ),
        pw.Expanded(
          child: pw.ListView.builder(
              itemBuilder: (_, index) {
                return _buildEngagementRowContent(
                  hasBg: index % 2 == 0,
                  engagement: DBProvider.db.getAllEngagements()[index],
                  sn: '${index + 1}',
                );
              },
              itemCount: DBProvider.db.getAllEngagements().length),
        ),
      ],
    );
  }
}

pw.Widget _buildRowItem({
  bool hasBox = false,
  String text = "",
  bool engagement = false,
}) {
  return pw.Expanded(
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        pw.Text(
          text,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 12.sp,
            color: const PdfColor(0, 0, 0, 1),
          ),
        ),
      ],
    ),
  );
}

pw.Widget _buildEngagementRowContent({
  required String sn,
  PatientEngagement? engagement,
  bool hasBg = false,
}) {
  return pw.Container(
    color: hasBg ? const PdfColor(37/255, 116/255, 179/255, 0.1) : const PdfColor(1, 1, 1),
    child: pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 5.0),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            child: pw.Text(
              '$sn.',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 14.sp,
                color: const PdfColor(20/255, 20/255, 43/255, 1),
              ),
            ),
          ),
          text(
            engagement!.schedule!.patient!.firstName,
          ),
          text(
            engagement.temperature,
          ),
          text(
            engagement.pulse,
          ),
          text(
            engagement.upperBloodPressure,
          ),
          text(
            engagement.lowerBloodPressure,
          ),
          text(
            engagement.oxySaturation,
          ),
          text(
            engagement.respiratoryRate,
          ),
          text(
            engagement.height,
          ),
          text(
            engagement.weight,
          ),
          pw.Expanded(
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Icon(
                const pw.IconData(0xe3f3),
                color: const PdfColor(8/255, 76/255, 172/255, 1),
                size: 15,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

pw.Widget text(String text) {
  return pw.Expanded(
    child: pw.Text(
      text,
      // textAlign: pw.TextAlign.start,
      style: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 14.sp,
        color: const PdfColor(110/255, 113/255, 145/255, 1),
      ),
    ),
  );
}
