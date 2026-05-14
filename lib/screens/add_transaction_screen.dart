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

  String selectedCategory = "Makanan";

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

                labelText: "Tipe",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField(

              value: selectedCategory,

              items: const [

                DropdownMenuItem(
                  value: "Makanan",
                  child: Text("Makanan"),
                ),

                DropdownMenuItem(
                  value: "Transport",
                  child: Text("Transport"),
                ),

                DropdownMenuItem(
                  value: "Belanja",
                  child: Text("Belanja"),
                ),

                DropdownMenuItem(
                  value: "Hiburan",
                  child: Text("Hiburan"),
                ),

                DropdownMenuItem(
                  value: "Tagihan",
                  child: Text("Tagihan"),
                ),

                DropdownMenuItem(
                  value: "Gaji",
                  child: Text("Gaji"),
                ),
              ],

              onChanged: (value) {

                setState(() {

                  selectedCategory = value!;
                });
              },

              decoration: const InputDecoration(

                labelText: "Kategori",

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

                        category: selectedCategory,
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