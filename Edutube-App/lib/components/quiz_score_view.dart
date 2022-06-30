// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'dart:io';
import 'package:edutube/authentication/firebase_auth_service.dart';
import 'package:edutube/components/theme.dart';
import 'package:edutube/models/user.dart';
import 'package:edutube/pdf/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:edutube/models/quiz_controller.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

class QuizScoreView extends StatefulWidget {
  QuizScoreView({Key? key}) : super(key: key);

  @override
  State<QuizScoreView> createState() => _QuizScoreViewState();
}

class _QuizScoreViewState extends State<QuizScoreView> {
  late int sc = Get.arguments[0];
  late String courseName = Get.arguments[1];
  late String channel = Get.arguments[2];

  final pdf = pw.Document();

  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File receiptFile = File("$documentPath/example.pdf");
    receiptFile.writeAsBytesSync(List.from(await pdf.save()));
  }

  var profileImage;

  @override
  void initState() {
    doSomeAsyncStuff();

    super.initState();
  }

  Future<void> doSomeAsyncStuff() async {
    profileImage = pw.MemoryImage(
        (await rootBundle.load('assets/onboard/border.png'))
            .buffer
            .asUint8List());
  }

  writeOnPdf(UserModel? user) {
    pdf.addPage(pw.MultiPage(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      pageFormat: PdfPageFormat.a5,
      margin: pw.EdgeInsets.all(32),
      // pageTheme: pw.PageTheme(),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Container(
            color: PdfColors.blue300,
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  // pw.Header(
                  // level: 0,
                  pw.SizedBox(height: 4.0),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: <pw.Widget>[
                        pw.Text('EduTube',
                            textScaleFactor: 1,
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                color: PdfColors.red, letterSpacing: 2.0)),
                      ]),
                  // ),
                  pw.SizedBox(height: 3.0),
                  pw.Center(
                    child: pw.Image(profileImage, width: 110),
                  ),
                  pw.SizedBox(height: 4.0),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center,
                      // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(10),
                          child: pw.Center(
                            child: pw.Text('CERTIFICATE OF COMPLETION',
                                textScaleFactor: 1.2,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontWeight: pw.FontWeight.bold,
                                    letterSpacing: 2)),
                          ),
                        )
                      ]),
                  // pw.Header(level: 1, text: 'What is Lorem Ipsum?'),
                  pw.SizedBox(height: 10.0),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center,
                      // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Center(
                          child: pw.Text('IS HEREBY GRANTED TO',
                              textScaleFactor: 1,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 2.0)),
                        )
                      ]),
                  pw.SizedBox(height: 15.0),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center,
                      // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Center(
                          child: pw.Text(user!.displayName!,
                              textScaleFactor: 2,
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 4.0)),
                        )
                      ]),
                  pw.SizedBox(height: 15.0),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center,
                      // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Flexible(
                          child: pw.Center(
                            child: pw.Padding(
                              padding: pw.EdgeInsets.all(10),
                              child: pw.Text(courseName,
                                  textScaleFactor: 2,
                                  // overflow: pw.TextOverflow.clip,
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      color: PdfColors.black,
                                      fontWeight: pw.FontWeight.bold,
                                      letterSpacing: 4.0)),
                            ),
                          ),
                        )
                      ]),
                  pw.SizedBox(height: 15.0),
                  pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Header(level: 1, text: channel),
                        pw.Header(level: 1, text: date),
                      ]),
                  // Write All the paragraph in one line.
                  // For clear understanding
                  // here there are line breaks.

                  pw.Padding(padding: const pw.EdgeInsets.all(10)),
                ]),
          ),
        ];
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _control = Get.put(QuestionController());
    final user = Provider.of<FirebaseAuthService>(context).currentUser();
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image.asset("assets/img/trophy.png")),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Score",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: kSecondaryColor),
                  ),
                  Spacer(),
                  Text(
                    "${sc * 10}/${_control.questions.length * 10}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: kSecondaryColor),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: CustomAppTheme.nearlyYoutubeRed,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: CustomAppTheme.nearlyYoutubeRed
                                    .withOpacity(0.5),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Center(
                            child: TextButton(
                          child: Text(
                            'Get Certificate',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: CustomAppTheme.nearlyWhite,
                            ),
                          ),
                          onPressed: () async {
                            writeOnPdf(user);
                            await savePdf();

                            Directory documentDirectory =
                                await getApplicationDocumentsDirectory();

                            String documentPath = documentDirectory.path;

                            String fullPath = "$documentPath/example.pdf";
                            print(fullPath);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PdfPreviewScreen(
                                          path: fullPath,
                                        )));
                          },
                        )),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
