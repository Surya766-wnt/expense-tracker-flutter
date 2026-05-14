import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/transaction_data.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, double> categoryTotals = {};

    double totalExpense = 0;
    double totalIncome = 0;

    for (var transaction in transactions) {

      if (transaction.type == "Pemasukan") {

        totalIncome += transaction.amount;
      }

      if (transaction.type == "Pengeluaran") {

        totalExpense += transaction.amount;

        if (categoryTotals.containsKey(
          transaction.category,
        )) {

          categoryTotals[
          transaction.category] =

              categoryTotals[
              transaction.category]! +

                  transaction.amount;

        } else {

          categoryTotals[
          transaction.category] =

              transaction.amount;
        }
      }
    }

    final colors = [

      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.teal,
    ];

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Statistik Keuangan",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Row(

              children: [

                Expanded(

                  child: Container(

                    padding:
                    const EdgeInsets.all(
                      16,
                    ),

                    decoration: BoxDecoration(

                      color: Colors.green,

                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                    ),

                    child: Column(

                      children: [

                        const Text(

                          "Pemasukan",

                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(

                          "Rp ${totalIncome.toInt()}",

                          style:
                          const TextStyle(

                            color: Colors.white,

                            fontWeight:
                            FontWeight.bold,

                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(

                  child: Container(

                    padding:
                    const EdgeInsets.all(
                      16,
                    ),

                    decoration: BoxDecoration(

                      color: Colors.red,

                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                    ),

                    child: Column(

                      children: [

                        const Text(

                          "Pengeluaran",

                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(

                          "Rp ${totalExpense.toInt()}",

                          style:
                          const TextStyle(

                            color: Colors.white,

                            fontWeight:
                            FontWeight.bold,

                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(

              height: 350,

              child: PieChart(

                PieChartData(

                  centerSpaceRadius: 70,

                  sectionsSpace: 3,

                  sections: List.generate(

                    categoryTotals.length,

                        (index) {

                      final category =
                      categoryTotals.keys
                          .elementAt(index);

                      final amount =
                      categoryTotals[
                      category]!;

                      return PieChartSectionData(

                        color: colors[
                        index %
                            colors.length],

                        value: amount,

                        radius: 90,

                        title:

                        "${((amount / totalExpense) * 100).toStringAsFixed(0)}%",

                        titleStyle:
                        const TextStyle(

                          color: Colors.white,

                          fontWeight:
                          FontWeight.bold,

                          fontSize: 16,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(

              child: ListView.builder(

                itemCount:
                categoryTotals.length,

                itemBuilder:
                    (context, index) {

                  final category =
                  categoryTotals.keys
                      .elementAt(index);

                  final amount =
                  categoryTotals[
                  category]!;

                  return Container(

                    margin:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    padding:
                    const EdgeInsets.all(
                      16,
                    ),

                    decoration: BoxDecoration(

                      color:
                      const Color(
                        0xFF1E1E1E,
                      ),

                      borderRadius:
                      BorderRadius.circular(
                        16,
                      ),
                    ),

                    child: Row(

                      children: [

                        Container(

                          width: 18,

                          height: 18,

                          decoration:
                          BoxDecoration(

                            color: colors[
                            index %
                                colors.length],

                            shape:
                            BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(

                          child: Text(

                            category,

                            style:
                            const TextStyle(

                              color:
                              Colors.white,

                              fontSize: 16,
                            ),
                          ),
                        ),

                        Text(

                          "Rp ${amount.toInt()}",

                          style:
                          const TextStyle(

                            color:
                            Colors.white70,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}