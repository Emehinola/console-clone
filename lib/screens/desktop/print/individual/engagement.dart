import 'dart:io';
import 'dart:typed_data';
import 'package:console/database/provider.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/services/console-services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class SingleEng extends StatelessWidget {
  dynamic image;
  PatientEngagement engagement;

  SingleEng({
    this.image,
    required this.engagement,
  });

  @override
  Widget build(Context context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Patient Engagement',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.01.sh),
              detailRow('First Name', engagement.schedule!.patient!.firstName, 'Last Name', engagement.schedule!.patient!.lastName),
              SizedBox(height: 0.01.sh),
              Divider(),
              SizedBox(height: 0.01.sh),
              detailRow(
                  'Temperature', engagement.temperature, 'Pulse', engagement.pulse),
              SizedBox(height: 0.01.sh),
              Divider(),
              SizedBox(height: 0.01.sh),
              detailRow('Upp. Blood Pres', engagement.upperBloodPressure, 'Lower Blood Pres', engagement.lowerBloodPressure),
              SizedBox(height: 0.01.sh),
              Divider(),
              SizedBox(height: 0.01.sh),
              detailRow('Oxygen Saturation', engagement.oxySaturation, 'Respiratory Rate', engagement.respiratoryRate),
              SizedBox(height: 0.06.sh),SizedBox(height: 0.01.sh),
              Divider(),
              SizedBox(height: 0.01.sh),
              detailRow('Height', engagement.height, 'Weight', engagement.weight),
              SizedBox(height: 0.06.sh),
            ],
          ),),
        ],
      ),
    );
  }
}

Future<Uint8List> generateIndividualEngagementPdf(
    PdfPageFormat pageFormat, PatientEngagement engagement
    ) async {
  //Create a PDF document.
  final document = Document();
  String? bg;

  final image = MemoryImage(
    (await rootBundle.load('assets/images/console.jpeg')).buffer.asUint8List(),
  );

  document.addPage(
    Page(
      pageTheme: PageTheme(
        pageFormat: PdfPageFormat.letter,
        orientation: PageOrientation.landscape,
        theme: ThemeData.withFont(
          base: await PdfGoogleFonts.openSansRegular(),
          bold: await PdfGoogleFonts.openSansBold(),
        ),
        buildForeground: bg == null
            ? null
            : (context) =>
            FullPage(ignoreMargins: true, child: SvgImage(svg: bg)),
      ),
      build: (context) => Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SingleEng(image: image, engagement: engagement),
      ),
    ),
  );

  // final Directory tempDir = await getTemporaryDirectory();

  // final file = File('${tempDir.path}/engagement.pdf'); // File("C:\\Users\\Firstlady\\OneDrive\\Documents\\engagement.pdf");
  // return await file.writeAsBytes(await document.save());

  return document.save();
}

// void printEngagement(PatientEngagement engagement) async{
//   const title = 'Patients Engagement';
//   await Printing.layoutPdf(onLayout: (format) => generateEngagementPdf(format, engagement));
// }

pw.Widget detailRow(String title1, String value1, String title2, String value2,
    {bool isFull = false}) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              value1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      if (!isFull)
        SizedBox(
          width: 0.08.sw,
        ),
      if (!isFull)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12.sp),
              ),
              Text(
                value2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        )
    ],
  );
}