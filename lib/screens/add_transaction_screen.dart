import 'package:flutter/material.dart';

import '../data/transaction_data.dart';
import '../models/transaction_model.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends State<AddTransactionScreen> {

  final TextEditingController titleController =
  TextEditingController();

  final TextEditingController amountController =
  TextEditingController();

  String selectedType = "Pemasukan";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Tambah Transaksi"),
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

            const SizedBox(height: 16),

            DropdownButtonFormField(

              value: selectedType,

              items: const [

                DropdownMenuItem(
                  value: "Pemasukan",
                  child: Text("Pemasukan"),
                ),

                DropdownMenuItem(
                  value: "Pengeluaran",
                  child: Text("Pengeluaran"),
                ),
              ],

              onChanged: (value) {

                setState(() {

                  selectedType = value!;
                });
              },

              decoration: const InputDecoration(

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

                  if (title.isNotEmpty &&
                      amount.isNotEmpty) {

                    transactions.add(

                      TransactionModel(

                        title: title,

                        amount:
                        double.parse(amount),

                        type: selectedType,
                      ),
                    );

                    Navigator.pop(context);
                  }
                },

                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}