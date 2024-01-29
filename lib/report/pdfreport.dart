import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:async';
import 'package:pdf/widgets.dart' as pw;
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title,});
  String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed:()=>_createpdf(),
            child: Text("pdfReport"),
        ),
      ),
    );
  }
  Future<File> _createpdf() async {
    final pdf = pw.Document();
    final data = await rootBundle.load('assets/Cairo/static/NotoNaskhArabic-Bold.ttf');
    final loadedfont =pw.Font.ttf(data);
    pdf.addPage(
      pw.MultiPage(
          maxPages: 100,
          pageFormat: PdfPageFormat.a4,
          // crossAxisAlignment: pw.CrossAxisAlignment.start,
          orientation: pw.PageOrientation.portrait,
          textDirection: pw.TextDirection.rtl,
          theme: pw.ThemeData.withFont(
            base: loadedfont,
            bold: loadedfont,
          ),
          build: (pw.Context context) => [
            pw.Center(
           child: pw.Text("تقرير للفترة من .... الى.....",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 20,color: PdfColor.fromHex("#0000CD")),
             ),),
            pw.Row(children:[
              pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      margin: pw.EdgeInsets.only(left: 15,),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                              pw.Row(
                                  children:[
                                    pw.Text("عــدد الايام الماجرة: ", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                                  ]),
                              pw.Row(
                                  children:[
                                    pw.Text("عــدد الحجوزات الجديدة: ", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                                  ]),
                            pw.Text("أجمالي ألايجارات : ", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                            pw.Text("أجمالي الحجوزات :", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                            // pw.Divider(thickness: 1)
                          ]))),
              pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      margin: pw.EdgeInsets.only(bottom: 12),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          // mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text("المبلغ المحصلة : ", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                            pw.Text("المبالغ المتبقي  :", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                            pw.Text("اجمالي صافي ألايرادات المتوقع:  ", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                          ]))),
              pw.Expanded(
                  flex: 2,
                  child: pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      margin: pw.EdgeInsets.only(bottom: 12),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          // mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text("اجمالي المصروفات  : ", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                            pw.Text("المصروفات المتوقع  :", style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold)),
                          ]))),
            ]),
            pw.Center(
              child: pw.Text("جدول الحجوزات (ألأيجارات لشهر...)",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
              ),),
              pw.Table(
                  border: pw.TableBorder.all(
                      color: PdfColor.fromHex("#000000")),//607D8BFF
                  children:
                  [
                    pw.TableRow(
                        decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                        children: [
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المتبقي", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Container(
                              padding: pw.EdgeInsets.all(4),
                              width: 40,
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المدفوع", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المبلغ", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("اسم الزبون", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("اليوم", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("رقم العقد", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                  // pw.Divider(thickness: 1)
                                ]
                            ),
                          ),
                        ]),
                      pw.TableRow(
                          children: [
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text(" ", style: pw.TextStyle(fontSize: 6)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ]))
                          ])
                  ]
              ),
            pw.Center(
              child: pw.Text("جدول الحجوزات الجديدة",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
              ),),
              pw.Table(
                  border: pw.TableBorder.all(
                      color: PdfColor.fromHex("#000000")),
                  children: [
                    pw.TableRow(
                        decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                        children: [
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المتبقي", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8,fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Container(
                              padding: pw.EdgeInsets.all(4),
                              width: 40,
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المدفوع", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Container(
                              padding: pw.EdgeInsets.all(4),
                              width: 40,
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المبلغ", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("اسم الزبون", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                    // pw.Divider(thickness: 1)
                                  ])),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("اليوم", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                  // pw.Divider(thickness: 1)
                                ]
                            ),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("التاريخ", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                  // pw.Divider(thickness: 1)
                                ]
                            ),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("رقم العقد", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]
                            ),
                          ),
                        ]),
                      pw.TableRow(
                          children: [
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text(" ", style: pw.TextStyle(fontSize: 6)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("",style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("",style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("",style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("",style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                    ]))
                          ])
                  ]),    pw.Center(
              child: pw.Text("جدول تقرير المصروفات",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
              ),),
                pw.Table(
                  border: pw.TableBorder.all(color: PdfColor.fromHex("#000000"),style: pw.BorderStyle.solid),
                  children: [
                    pw.TableRow(
                        decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                        children: [
                          pw.Container(
                              padding: pw.EdgeInsets.all(4),
                              width: 40,
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("المبلغ", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                  ])),
                          pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("اسم المصروف", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]
                            ),
                          ),
                        ]),
                      pw.TableRow(
                          children: [
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text(" ", style: pw.TextStyle(fontSize: 6)),
                                    ])),
                            pw.Padding(
                                padding: pw.EdgeInsets.all(4),
                                child: pw.Column(
                                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                                    mainAxisAlignment: pw.MainAxisAlignment.center,
                                    children: [
                                      pw.Text("",style: pw.TextStyle(fontSize: 6,)),
                                    ])),
                          ]),
                    pw.TableRow(
                        decoration: pw.BoxDecoration(border:pw.Border.symmetric(horizontal: pw.BorderSide(color: PdfColors.black,width: 1.0,style: pw.BorderStyle.solid)) ),
                        children: [
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text(" ", style: pw.TextStyle(fontSize: 6,fontWeight: pw.FontWeight.bold)),
                                  ])),
                          pw.Padding(
                              padding: pw.EdgeInsets.all(4),
                              child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text("الاجمالي",style: pw.TextStyle(fontSize: 6,fontWeight: pw.FontWeight.bold)),
                                  ])),
                        ]),
                  ]),
          ]),
    );
    final output = await getApplicationSupportDirectory();
    final file = File('${output.path}/تقرير الحجوزات.pdf');
    file.writeAsBytesSync(await pdf.save());
    OpenFile.open('${output.path}/تقرير الحجوزات.pdf');
    return file;
  }
}