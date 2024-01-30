import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/services.dart';
import 'package:report/report/ReportTable.dart';
import 'package:report/report/datatable2.dart';
import 'package:report/report/ExpensesTable.dart';
class MonthlyReport{

  String title;
  String month;
  String rentedCount;
  String rentedTotal;
  String reservedCount;
  String reservedTotal;

  MonthlyReport({this.title='',this.month='',this.rentedCount='',this.rentedTotal=''
      ,this.reservedCount='',this.reservedTotal=''
     , required this.table1,required this.table2,required this.expensesTable});

  List<ReportTable> table1=[];
  List<ReportTable> table2=[];
  List<ExpensesTable> expensesTable=[];

  Future<File> exportToPDF() async {
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
            pw.SizedBox(height: 20),
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
                                  pw.Text("اجمالي دولار", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("اجمالي ريال", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("العدد", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("ألأسم", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]
                            ))]),
                  pw.TableRow(
                      children: [
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(rentedTotal, style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(rentedTotal, style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(rentedCount, style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("حجوزات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("أيجارات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                ]),
            pw.Table(
                border: pw.TableBorder.all(color: PdfColor.fromHex("#000000")),
                children:[
                  pw.TableRow(
                    // decoration: pw.BoxDecoration(border:pw.Border.symmetric(horizontal: pw.BorderSide(color: PdfColors.black,width: 1.0,style: pw.BorderStyle.solid)) ),
                      children: [
                        pw.Container(
                          // color:PdfColor.fromHex("#E0FFFF"),
                            width: 30,
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
                                  pw.Text("الاجمالي",style: pw.TextStyle(fontSize: 8,fontWeight:pw.FontWeight.bold)),
                                ]))])
                ]),
            // pw.Center(
            //   child: pw.Text("جدول الحجوزات (ألأيجارات لشهر...)",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
            //   ),),
            pw.SizedBox(height: 20),
            pw.Table(
                border: pw.TableBorder.all(
                    color: PdfColor.fromHex("#000000")),//607D8BFF
                children:
                [
                  pw.TableRow(
                      decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                      children: [
                        pw.Container(
                            width: 70,
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("الاجمالي", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          // width: 50,
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text("ألأسم", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
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
                                  pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("الايرادات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("المصروفات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
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
                                  pw.Text("الصافي المتبقي",style: pw.TextStyle(fontSize: 8,fontWeight: pw.FontWeight.bold)),
                                ]))])]),
            pw.SizedBox(height: 20),
            pw.Table(
                border: pw.TableBorder.all(
                    color: PdfColor.fromHex("#000000")),//607D8BFF
                children:
                [
                  pw.TableRow(
                      decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                      children: [
                        pw.Container(
                          // width: 70,
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("أجمالي صافي ألايرادات المتوقع", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            // width: 50,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("أجمالي المصروفات المتوقعة", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            // width: 50,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("أجمالي الأيرادات", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                      ]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                ]),
            pw.Center(
                child: pw.Text("جدول الحجوزات (ألأيجارات لشهر...)",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
                )),
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
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("التاريخ", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
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
                  for(var i=0;i<table1.length;i++)
                  pw.TableRow(
                      children: [
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].late}", style: pw.TextStyle(fontSize: 6)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].pays} ", style: pw.TextStyle(fontSize: 6)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].money}", style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].customerName}", style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].today}", style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].date}", style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("${table1[i].refID}", style: pw.TextStyle(fontSize: 6,)),
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

  Future<File> exportToPDF2() async {
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
            pw.SizedBox(height: 20),
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
                                  pw.Text("الاجمالي", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("العدد", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            width: 20,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("ألأسم", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]
                            ))]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("حجوزات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("أيجارات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                ]),
            pw.Table(
                border: pw.TableBorder.all(color: PdfColor.fromHex("#000000")),
                children:[
                  pw.TableRow(
                    // decoration: pw.BoxDecoration(border:pw.Border.symmetric(horizontal: pw.BorderSide(color: PdfColors.black,width: 1.0,style: pw.BorderStyle.solid)) ),
                      children: [
                        pw.Container(
                          // color:PdfColor.fromHex("#E0FFFF"),
                            width: 30,
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
                                  pw.Text("الاجمالي",style: pw.TextStyle(fontSize: 8,fontWeight:pw.FontWeight.bold)),
                                ]))])
                ]),
            // pw.Center(
            //   child: pw.Text("جدول الحجوزات (ألأيجارات لشهر...)",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
            //   ),),
            pw.SizedBox(height: 20),
            pw.Table(
                border: pw.TableBorder.all(
                    color: PdfColor.fromHex("#000000")),//607D8BFF
                children:
                [
                  pw.TableRow(
                      decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                      children: [
                        pw.Container(
                            width: 70,
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("الاجمالي", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                          padding: pw.EdgeInsets.all(4),
                          // width: 50,
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text("ألأسم", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
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
                                  pw.Text("", style: pw.TextStyle(fontSize: 6,)),
                                ])),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("الايرادات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("المصروفات", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
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
                                  pw.Text("الصافي المتبقي",style: pw.TextStyle(fontSize: 8,fontWeight: pw.FontWeight.bold)),
                                ]))])]),
            pw.SizedBox(height: 20),
            pw.Table(
                border: pw.TableBorder.all(
                    color: PdfColor.fromHex("#000000")),//607D8BFF
                children:
                [
                  pw.TableRow(
                      decoration:pw.BoxDecoration(color:PdfColor.fromHex("#607D8BFF"),borderRadius: pw.BorderRadius.circular(4)),
                      children: [
                        pw.Container(
                          // width: 70,
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("أجمالي صافي ألايرادات المتوقع", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            // width: 50,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("أجمالي المصروفات المتوقعة", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                        pw.Container(
                            padding: pw.EdgeInsets.all(4),
                            // width: 50,
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("أجمالي الأيرادات", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ])),
                      ]),
                  pw.TableRow(
                      children: [
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
                                  pw.Text("", style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                                ]))]),
                ]),
            pw.Center(
                child: pw.Text("جدول الحجوزات (ألأيجارات لشهر...)",style:pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 13,),
                )),
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
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text("التاريخ", style: pw.TextStyle(color:PdfColor.fromHex("#E0FFFF"),fontSize: 8, fontWeight: pw.FontWeight.bold)),
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