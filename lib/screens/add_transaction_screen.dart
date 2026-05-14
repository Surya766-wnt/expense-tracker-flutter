import 'package:flutter/material.dart';

import '../data/transaction_data.dart';
import '../models/transaction_model.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  String selectedType = "Pemasukan";

  String selectedCategory = "Makanan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Transaksi")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: titleController,

              style: const TextStyle(color: Colors.white),

              decoration: const InputDecoration(
                hintText: "Nama Transaksi",

                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: amountController,

              keyboardType: TextInputType.number,

              style: const TextStyle(color: Colors.white),

              decoration: const InputDecoration(
                hintText: "Nominal",

                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: selectedType,

              dropdownColor: const Color(0xFF1E1E1E),

              style: const TextStyle(color: Colors.white),

              items: const [
                DropdownMenuItem(value: "Pemasukan", child: Text("Pemasukan")),

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

              decoration: const InputDecoration(hintText: "Tipe"),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              value: selectedCategory,

              dropdownColor: const Color(0xFF1E1E1E),

              style: const TextStyle(color: Colors.white),

              items: const [
                DropdownMenuItem(value: "Makanan", child: Text("Makanan")),

                DropdownMenuItem(value: "Transport", child: Text("Transport")),

                DropdownMenuItem(value: "Belanja", child: Text("Belanja")),

                DropdownMenuItem(value: "Hiburan", child: Text("Hiburan")),

                DropdownMenuItem(value: "Tagihan", child: Text("Tagihan")),

                DropdownMenuItem(value: "Gaji", child: Text("Gaji")),
              ],

              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },

              decoration: const InputDecoration(hintText: "Kategori"),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,

                  padding: const EdgeInsets.symmetric(vertical: 16),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                onPressed: () {
                  transactions.add(
                    TransactionModel(
                      title: titleController.text,

                      amount: double.parse(amountController.text),

                      type: selectedType,

                      category: selectedCategory,
                    ),
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "Simpan",

                  style: TextStyle(
                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
