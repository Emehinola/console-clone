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

class Calendar extends StatelessWidget {
  dynamic image;

  Calendar({
    this.image,
  });

  Widget title(
    Context context,
  ) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(image: DecorationImage(image: image), borderRadius: BorderRadius.circular(5.0)),
          ),
          SizedBox(width: 10.0),
          Text(
            'Patient Appointments',
            style: TextStyle(
              color: PdfColors.deepPurple,
              fontSize: 20.sp,
            ),
          ),
        ]));
  }

  Widget header(
    Context context,
    String text,
  ) {
    return Container(
      color: PdfColors.blue200,
      padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
        ),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    );
  }

  Widget day(
    Context context,
    String data,
  ) {
    var style = const TextStyle();
    var color = PdfColors.grey300;

    return Container(
      padding: const EdgeInsets.all(4),
      color: color,
      child: Text(
        data,
        textAlign: TextAlign.left,
        style: style,
      ),
    );
  }

  List<String> headerTexts = [
    'FULL NAME',
    'APPT. DATE',
    'EMAIL',
    'PRIMARY ASSIGNMENT',
    'NATIONALITY'
  ];

  @override
  Widget build(Context context) {

    List<String> data = [];

    for (PatientEngagement value in DBProvider.db.getAllEngagements()) {
      data.add(value.schedule!.patientName);
      data.add(ConsoleService.processReadableDate(
          value.schedule!.appointmentDate.value));
      data.add(value.schedule!.patient!.email);
      data.add(value.schedule!.patient!.primaryAss);
      data.add('Nigerian');
    }

    final head = Row(
      mainAxisSize: MainAxisSize.max,
      children: List<Widget>.generate(headerTexts.length, (int index) {
        return Expanded(
          child: Container(
            foregroundDecoration: BoxDecoration(
              border: Border(
                top: const BorderSide(color: PdfColors.grey),
                left: const BorderSide(color: PdfColors.grey),
                right: index % 7 == 6
                    ? const BorderSide(color: PdfColors.grey)
                    : BorderSide.none,
                bottom: const BorderSide(color: PdfColors.grey),
              ),
            ),
            child: header(context, headerTexts[index]),
          ),
        );
      }),
    );

    final body = GridView(
      crossAxisCount: headerTexts.length,
      children: List<Widget>.generate(data.length, (int index) {
        return Container(
          foregroundDecoration: BoxDecoration(
              border: Border(
            left: const BorderSide(color: PdfColors.grey),
            right: index % 5 == 4
                ? const BorderSide(color: PdfColors.grey)
                : BorderSide.none,
            bottom: const BorderSide(color: PdfColors.grey),
          )),
          child: day(context, data[index]),
        );
      }),
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          title(context),
          head,
          Expanded(child: body),
        ],
      ),
    );
  }
}

Future<Uint8List> generateEngagementPdf(
  PdfPageFormat pageFormat,
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
        child: Calendar(image: image),
      ),
    ),
  );

  // final Directory tempDir = await getTemporaryDirectory();

  // final file = File('${tempDir.path}/engagement.pdf'); // File("C:\\Users\\Firstlady\\OneDrive\\Documents\\engagement.pdf");
  // return await file.writeAsBytes(await document.save());

  return document.save();
}

void printEngagement() async{
  const title = 'Patients Engagement';
  await Printing.layoutPdf(onLayout: (format) => generateEngagementPdf(format));
}
