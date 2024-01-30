import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:async';
import 'package:pdf/widgets.dart' as pw;

import 'ExpensesTable.dart';
import 'MonthlyReport.dart';
import 'ReportTable.dart';
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
            onPressed:()=>createPDF(),
            child: Text("pdfReport"),
        ),
      ),
    );
  }
  void createPDF()
  {
    List<ReportTable> table1=[];
    List<ReportTable> table2=[];
    List<ExpensesTable> expensesTable=[];
    table1.add(ReportTable(refID: "1",date: "01/01/2024",customerName: "hamdi",money: 1000,pays: 200,late: 800));
    table2.add(ReportTable(refID: "1",date: "01/01/2024",customerName: "hamdi",money: 1000,pays: 200,late: 800));
    expensesTable.add(ExpensesTable(name: "ديزل",total:  800));
    MonthlyReport monthlyReport=MonthlyReport(title: "month 1",month: "1",rentedCount: "10",rentedTotal: "100000",
    table1: table1,
    table2: table2,
    expensesTable: expensesTable);
    monthlyReport.exportToPDF();
  }

}