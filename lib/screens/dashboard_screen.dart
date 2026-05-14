import 'package:flutter/material.dart';

import '../data/transaction_data.dart';
import 'add_transaction_screen.dart';
import 'pdf_screen.dart';
import 'statistic_screen.dart';

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

      if (transaction.type ==
          "Pemasukan") {

        totalSaldo += transaction.amount;

      } else {

        totalSaldo -= transaction.amount;
      }
    }

    return Scaffold(

      floatingActionButton:
      FloatingActionButton(

        backgroundColor: Colors.green,

        onPressed: () async {

          await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (context) =>
              const AddTransactionScreen(),
            ),
          );

          setState(() {

          });
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(

              "Total Saldo",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(

              width: double.infinity,

              padding:
              const EdgeInsets.all(20),

              decoration: BoxDecoration(

                gradient:
                const LinearGradient(

                  colors: [

                    Color(0xFF00C853),

                    Color(0xFF64DD17),
                  ],
                ),

                borderRadius:
                BorderRadius.circular(16),
              ),

              child: Text(

                "Rp $totalSaldo",

                style: const TextStyle(

                  fontSize: 28,

                  color: Colors.white,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(

              "Daftar Transaksi",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(

              child: ListView.builder(

                itemCount:
                transactions.length,

                itemBuilder:
                    (context, index) {

                  final transaction =
                  transactions[index];

                  return Card(

                    child: ListTile(

                      leading: CircleAvatar(

                        backgroundColor:

                        transaction.type ==
                            "Pemasukan"

                            ? Colors.green

                            : Colors.red,

                        child: Icon(

                          transaction.type ==
                              "Pemasukan"

                              ? Icons.arrow_downward

                              : Icons.arrow_upward,

                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        transaction.title,
                      ),

                      subtitle: Text(

                        "${transaction.category} • ${transaction.type}",
                      ),

                      trailing: Row(

                        mainAxisSize:
                        MainAxisSize.min,

                        children: [

                          Text(

                            "Rp ${transaction.amount}",

                            style: TextStyle(

                              color:

                              transaction.type ==
                                  "Pemasukan"

                                  ? Colors.green

                                  : Colors.red,

                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          IconButton(

                            onPressed: () {

                              showDialog(

                                context: context,

                                builder: (context) {

                                  return AlertDialog(

                                    title:
                                    const Text(
                                      "Hapus Transaksi",
                                    ),

                                    content:
                                    const Text(
                                      "Yakin ingin menghapus transaksi?",
                                    ),

                                    actions: [

                                      TextButton(

                                        onPressed: () {

                                          Navigator.pop(
                                            context,
                                          );
                                        },

                                        child:
                                        const Text(
                                          "Batal",
                                        ),
                                      ),

                                      TextButton(

                                        onPressed: () {

                                          setState(() {

                                            transactions.removeAt(
                                              index,
                                            );
                                          });

                                          Navigator.pop(
                                            context,
                                          );
                                        },

                                        child:
                                        const Text(
                                          "Hapus",
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },

                            icon: const Icon(

                              Icons.delete,

                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Row(

              children: [

                Expanded(

                  child: GestureDetector(

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>
                          const StatisticScreen(),
                        ),
                      );
                    },

                    child: Container(

                      margin:
                      const EdgeInsets.only(
                        right: 10,
                      ),

                      padding:
                      const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                      BoxDecoration(

                        color:
                        const Color(
                          0xFF1E1E1E,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          16,
                        ),
                      ),

                      child: const Column(

                        children: [

                          Icon(

                            Icons.pie_chart,

                            color: Colors.green,

                            size: 35,
                          ),

                          SizedBox(height: 10),

                          Text(

                            "Statistik",

                            style: TextStyle(
                              color:
                              Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(

                  child: GestureDetector(

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>
                          const PdfScreen(),
                        ),
                      );
                    },

                    child: Container(

                      margin:
                      const EdgeInsets.only(
                        left: 10,
                      ),

                      padding:
                      const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                      BoxDecoration(

                        color:
                        const Color(
                          0xFF1E1E1E,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          16,
                        ),
                      ),

                      child: const Column(

                        children: [

                          Icon(

                            Icons.picture_as_pdf,

                            color: Colors.red,

                            size: 35,
                          ),

                          SizedBox(height: 10),

                          Text(

                            "Export PDF",

                            style: TextStyle(
                              color:
                              Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}