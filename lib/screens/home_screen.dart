import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:michel_money/components/custom_header.dart';
import 'package:michel_money/components/totals.dart';
import 'package:michel_money/components/transactions_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final transactionListBox = Hive.box<Transaction>('transactions');

  final TextEditingController quantityController = TextEditingController();

  final TextEditingController detailController = TextEditingController();

  add(String quantity, String detail) {
    String formattedDate =
        DateFormat("EEEEE, dd MMMM yyyy").format(DateTime.now());
    String formattedTime = DateFormat.Hm().format(DateTime.now());
    final dataAdd = Transaction(
        date: formattedDate,
        time: formattedTime,
        detail: detail,
        quantity: int.parse(quantity));
    transactionListBox.add(dataAdd);
  }

  // Future<void> _showDataInputDialog(BuildContext context) async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actionsOverflowAlignment: OverflowBarAlignment.end,
              title: Text('Kategori'),
              content: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: quantityController,
                      decoration: InputDecoration(
                        hintText: 'Tembah Pengeluaran',
                      ),
                    ),
                    TextFormField(
                      controller: detailController,
                      decoration: InputDecoration(
                        hintText: 'Catatan',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      add(quantityController.text, detailController.text);
                    },
                    icon: Icon(Icons.save),
                    label: Text('Save'))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(185, 121, 62, 1),
              Color.fromRGBO(246, 223, 203, 1)
            ])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomHeader(),
              ),
              SizedBox(
                height: 1.h,
              ),
              ExpenseTotal(),
              // ListView(
              //   shrinkWrap: true,
              //   children: [
              //     Text('sup'),
              //     Text('data')
              //   ]
              // )
              Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: TransactionList()),
            ],
          ),
        ),
      ),
    );
  }
}
