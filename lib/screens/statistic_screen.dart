import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/transaction_data.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> categoryData = {};

    double totalPemasukan = 0;

    double totalPengeluaran = 0;

    for (var transaction in transactions) {
      if (transaction.type == "Pemasukan") {
        totalPemasukan += transaction.amount;
      } else {
        totalPengeluaran += transaction.amount;

        if (categoryData.containsKey(transaction.category)) {
          categoryData[transaction.category] =
              categoryData[transaction.category]! + transaction.amount;
        } else {
          categoryData[transaction.category] = transaction.amount;
        }
      }
    }

    final colors = [
      Colors.orange,
      Colors.blue,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.green,
      Colors.pink,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),

        elevation: 0,

        title: const Text("Statistik Keuangan"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                      ),

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [
                        const Text(
                          "Pemasukan",

                          style: TextStyle(color: Colors.white70),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Rp ${totalPemasukan.toInt()}",

                          style: const TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,

                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF5252), Color(0xFFFF7043)],
                      ),

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [
                        const Text(
                          "Pengeluaran",

                          style: TextStyle(color: Colors.white70),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Rp ${totalPengeluaran.toInt()}",

                          style: const TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,

                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.04),

                borderRadius: BorderRadius.circular(30),
              ),

              child: Column(
                children: [
                  const Text(
                    "Analisis Pengeluaran",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    height: 320,

                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,

                        centerSpaceRadius: 70,

                        sections: List.generate(categoryData.length, (index) {
                          final category = categoryData.keys.elementAt(index);

                          final amount = categoryData[category]!;

                          final total = categoryData.values.reduce(
                            (a, b) => a + b,
                          );

                          final percentage = (amount / total) * 100;

                          return PieChartSectionData(
                            color: colors[index % colors.length],

                            value: amount,

                            radius: 100,

                            title: "${percentage.toStringAsFixed(0)}%",

                            titleStyle: const TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.bold,

                              color: Colors.white,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            Align(
              alignment: Alignment.centerLeft,

              child: const Text(
                "Kategori Pengeluaran",

                style: TextStyle(
                  color: Colors.white,

                  fontSize: 20,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ...List.generate(categoryData.length, (index) {
              final category = categoryData.keys.elementAt(index);

              final amount = categoryData[category]!;

              return Container(
                margin: const EdgeInsets.only(bottom: 14),

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 16,

                      height: 16,

                      decoration: BoxDecoration(
                        color: colors[index % colors.length],

                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        category,

                        style: const TextStyle(
                          color: Colors.white,

                          fontSize: 16,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Text(
                      "Rp ${amount.toInt()}",

                      style: const TextStyle(
                        color: Colors.white70,

                        fontWeight: FontWeight.bold,

                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
