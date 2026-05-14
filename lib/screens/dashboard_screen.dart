import 'package:flutter/material.dart';

import '../data/transaction_data.dart';
import 'add_transaction_screen.dart';
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

        totalSaldo +=
            transaction.amount;

      } else {

        totalSaldo -=
            transaction.amount;
      }
    }

    return Scaffold(

      backgroundColor:
      const Color(0xFF0D0D0D),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF121212),

        elevation: 0,

        title: const Text(
          "Expense Tracker",
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation
          .endFloat,

      floatingActionButton: Padding(

        padding:
        const EdgeInsets.only(
          bottom: 140,
        ),

        child: FloatingActionButton(

          backgroundColor:
          Colors.green,

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
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(

              "Total Saldo",

              style: TextStyle(

                color: Colors.white,

                fontSize: 18,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(

              width: double.infinity,

              padding:
              const EdgeInsets.all(
                20,
              ),

              decoration: BoxDecoration(

                gradient:
                const LinearGradient(

                  colors: [

                    Color(0xFF00C853),

                    Color(0xFF64DD17),
                  ],
                ),

                borderRadius:
                BorderRadius.circular(
                  20,
                ),

                boxShadow: [

                  BoxShadow(

                    color:
                    Colors.green
                        .withOpacity(
                      0.3,
                    ),

                    blurRadius: 15,

                    spreadRadius: 2,
                  ),
                ],
              ),

              child: Text(

                "Rp ${totalSaldo.toInt()}",

                style:
                const TextStyle(

                  color: Colors.white,

                  fontSize: 28,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(

              "Daftar Transaksi",

              style: TextStyle(

                color: Colors.white,

                fontSize: 18,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(

              child: ListView.builder(

                itemCount:
                transactions.length,

                itemBuilder:
                    (context, index) {

                  final transaction =
                  transactions[index];

                  return Container(

                    margin:
                    const EdgeInsets.only(
                      bottom: 14,
                    ),

                    decoration:
                    BoxDecoration(

                      color: Colors.white
                          .withOpacity(
                        0.05,
                      ),

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),

                      border: Border.all(

                        color: Colors.white
                            .withOpacity(
                          0.08,
                        ),
                      ),

                      boxShadow: [

                        BoxShadow(

                          color: Colors
                              .green
                              .withOpacity(
                            0.08,
                          ),

                          blurRadius: 15,

                          spreadRadius: 1,
                        ),
                      ],
                    ),

                    child: ListTile(

                      contentPadding:
                      const EdgeInsets.symmetric(

                        horizontal: 20,

                        vertical: 10,
                      ),

                      leading: CircleAvatar(

                        radius: 26,

                        backgroundColor:

                        transaction.type ==
                            "Pemasukan"

                            ? Colors.green

                            : Colors.red,

                        child: Icon(

                          transaction.type ==
                              "Pemasukan"

                              ? Icons
                              .arrow_downward

                              : Icons
                              .arrow_upward,

                          color:
                          Colors.white,
                        ),
                      ),

                      title: Text(

                        transaction.title,

                        style:
                        const TextStyle(

                          color:
                          Colors.white,

                          fontWeight:
                          FontWeight.bold,

                          fontSize: 16,
                        ),
                      ),

                      subtitle: Padding(

                        padding:
                        const EdgeInsets.only(
                          top: 4,
                        ),

                        child: Text(

                          "${transaction.category} • ${transaction.type}",

                          style:
                          const TextStyle(

                            color:
                            Colors.white70,
                          ),
                        ),
                      ),

                      trailing: Row(

                        mainAxisSize:
                        MainAxisSize.min,

                        children: [

                          Text(

                            "Rp ${transaction.amount}",

                            style:
                            TextStyle(

                              color:

                              transaction.type ==
                                  "Pemasukan"

                                  ? Colors
                                  .greenAccent

                                  : Colors
                                  .redAccent,

                              fontWeight:
                              FontWeight.bold,

                              fontSize: 15,
                            ),
                          ),

                          IconButton(

                            onPressed: () {

                              setState(() {

                                transactions.removeAt(
                                  index,
                                );
                              });
                            },

                            icon: const Icon(

                              Icons.delete,

                              color:
                              Colors.redAccent,
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

                      padding:
                      const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                      BoxDecoration(

                        color:
                        Colors.white
                            .withOpacity(
                          0.05,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                      ),

                      child: const Column(

                        children: [

                          Icon(

                            Icons.pie_chart,

                            color:
                            Colors.green,

                            size: 34,
                          ),

                          SizedBox(height: 10),

                          Text(

                            "Statistik",

                            style: TextStyle(

                              color:
                              Colors.white,

                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(

                  child: GestureDetector(

                    onTap: () {

                    },

                    child: Container(

                      padding:
                      const EdgeInsets.all(
                        20,
                      ),

                      decoration:
                      BoxDecoration(

                        color:
                        Colors.white
                            .withOpacity(
                          0.05,
                        ),

                        borderRadius:
                        BorderRadius.circular(
                          20,
                        ),
                      ),

                      child: const Column(

                        children: [

                          Icon(

                            Icons.picture_as_pdf,

                            color:
                            Colors.redAccent,

                            size: 34,
                          ),

                          SizedBox(height: 10),

                          Text(

                            "Export PDF",

                            style: TextStyle(

                              color:
                              Colors.white,

                              fontWeight:
                              FontWeight.bold,
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