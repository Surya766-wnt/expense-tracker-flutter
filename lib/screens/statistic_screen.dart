import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../data/transaction_data.dart';

class StatisticScreen extends StatelessWidget {

  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double makanan = 0;
    double transport = 0;
    double belanja = 0;
    double gaji = 0;

    for (var transaction in transactions) {

      if (transaction.category == "Makanan") {

        makanan += transaction.amount;

      } else if (transaction.category ==
          "Transport") {

        transport += transaction.amount;

      } else if (transaction.category ==
          "Belanja") {

        belanja += transaction.amount;

      } else if (transaction.category ==
          "Gaji") {

        gaji += transaction.amount;
      }
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text("Statistik"),
      ),

      body: Center(

        child: SizedBox(

          height: 300,

          child: PieChart(

            PieChartData(

              sections: [

                PieChartSectionData(
                  value: makanan,
                  title: "Makanan",
                  color: Colors.orange,
                ),

                PieChartSectionData(
                  value: transport,
                  title: "Transport",
                  color: Colors.blue,
                ),

                PieChartSectionData(
                  value: belanja,
                  title: "Belanja",
                  color: Colors.green,
                ),

                PieChartSectionData(
                  value: gaji,
                  title: "Gaji",
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}