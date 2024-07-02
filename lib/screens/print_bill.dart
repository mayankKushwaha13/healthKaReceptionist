import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:printing/printing.dart';
import 'package:receptionist/constants/doctor_list.dart';

createBill({
  required double total,
  required String doctorID,
  required String patName,
  required String patAge,
  required String patGender,
  required String patPhone,
  required String date,
  required String time,
  required List<Map<String, String>> billDetails,
}) async {
  int index = doctors.indexWhere((e) => e.doctorId == doctorID);
  var doctor = doctors[index];
  var docImage = (await rootBundle.load(doctor.image)).buffer.asUint8List();
  final prescription = pw.Document();
  final fontfamily2 = await PdfGoogleFonts.latoRegular();
  prescription.addPage(pw.MultiPage(
      margin: const pw.EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      pageFormat: PdfPageFormat.a4,
      theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
        fontSize: 14,
        font: fontfamily2,
      )),
      footer: (context) {
        return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Text("Clinic Name : ",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text("Cure and Care Clinic "),
          ]),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Text("Ph : ",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Expanded(child: pw.Text("123456789/80/93")),
            pw.Text("Timings : ",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text("2 PM to 6 PM"),
          ]),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Text("Address : ",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text("Phase 2,phase 2 ground,Jodpurpark West Bengal, 700095"),
          ])
        ]);
      },
      build: (context) {
        return [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(children: [
                      pw.Text("Doctor : ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 18)),
                      pw.Text("${doctor.firstName} ${doctor.lastName}",
                          style: const pw.TextStyle(fontSize: 18)),
                    ]),
                    pw.Row(children: [
                      pw.Text("Qualification : ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 18)),
                      pw.Text(doctor.qualification,
                          style: const pw.TextStyle(fontSize: 18)),
                    ]),
                    pw.Row(children: [
                      pw.Text("Specialisation : ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 18)),
                      pw.Text(doctor.specialisation,
                          style: const pw.TextStyle(fontSize: 18)),
                    ]),
                  ],
                ),
                pw.Container(
                  child: pw.Image(pw.MemoryImage(docImage), height: 80),
                ),
              ],
            ),
            pw.Divider(
              thickness: 2,
            ),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(children: [
                          pw.Text("Patient Name : ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(patName),
                        ]),
                        pw.Row(children: [
                          pw.Text("Patient Number : ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(patPhone),
                        ]),
                      ]),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(children: [
                          pw.Text("Gender : ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(patGender),
                        ]),
                        pw.Row(children: [
                          pw.Text("Age : ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(patAge),
                        ]),
                      ]),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(children: [
                          pw.Text("Date : ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(
                              // "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              date),
                        ]),
                        pw.Row(children: [
                          pw.Text("Time : ",
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.Text(
                              // "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}"
                              time),
                        ]),
                      ])
                ]),
            pw.Divider(thickness: 2, color: PdfColors.indigo700),
            pw.Center(
              child: pw.Text("Bill",
                  style: pw.TextStyle(
                    fontSize: 22,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.indigo900,
                  )),
            ),
            pw.Divider(thickness: 2, color: PdfColors.indigo700),
            for (int i = 0; i < billDetails.length; i++)
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      billDetails[i]['service']!,
                      style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "Rs. ${billDetails[i]['charges']}",
                      style: const pw.TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ]),
            pw.Container(
              transform: Matrix4.translationValues(0, -450 + 21.4285714286 * billDetails.length.toDouble(), 0),
              child:pw.Column(
              children:[
                pw.Divider(),
                pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Total : ",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.Text("Rs. $total",
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ))
                ]),
                pw.Divider()
                ]
                ))
          ])
        ];
      }));

  final dir = await getTemporaryDirectory();
  const fileName = "bill.pdf";
  final savePath = path.join(dir.path, fileName);
  final file = File(savePath);
  await file.writeAsBytes(await prescription.save());
  OpenFilex.open(file.path);
}
