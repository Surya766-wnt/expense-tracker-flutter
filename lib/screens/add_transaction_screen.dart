import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../data/transaction_data.dart';

class AddTransactionScreen extends StatelessWidget {
  AddTransactionScreen({super.key});

  final TextEditingController titleController =
  TextEditingController();

  final TextEditingController amountController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Tambah Transaksi",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: titleController,

              decoration: const InputDecoration(
                labelText: "Nama Transaksi",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: amountController,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "Nominal",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  String title =
                      titleController.text;

                  String amount =
                      amountController.text;

                  transactions.add(

                    TransactionModel(
                      title: title,
                      amount: double.parse(amount),
                    ),
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "Simpan",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}