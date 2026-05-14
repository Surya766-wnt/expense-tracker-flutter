import 'package:flutter/material.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../data/transaction_data.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Export PDF")),

      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pdf = pw.Document();

            pdf.addPage(
              pw.Page(
                build: (pw.Context context) {
                  return pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,

                    children: [
                      pw.Text(
                        "Laporan Keuangan",

                        style: pw.TextStyle(fontSize: 24),
                      ),

                      pw.SizedBox(height: 20),

                      ...transactions.map((transaction) {
                        return pw.Text(
                          "${transaction.title} - Rp ${transaction.amount}",
                        );
                      }),
                    ],
                  );
                },
              ),
            );

            await Printing.layoutPdf(onLayout: (format) async => pdf.save());
          },

          child: const Text("Download PDF"),
        ),
      ),
    );
  }
}
