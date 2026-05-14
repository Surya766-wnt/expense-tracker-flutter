import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';
import '../data/transaction_data.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {

    double totalSaldo = 0;

    for (var transaction in transactions) {

      totalSaldo += transaction.amount;

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Total Saldo",
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Text(
                "Rp $totalSaldo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () async {

                await Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                        AddTransactionScreen(),
                  ),
                );

                setState(() {

                });

              },

              child: const Text(
                "Tambah Transaksi",
              ),
            )
          ],
        ),
      ),
    );
  }
}