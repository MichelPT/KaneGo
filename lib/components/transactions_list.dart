import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:michel_money/models/transaction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionList extends StatefulWidget {
  TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final transactionListBox = Hive.box<Transaction>('transactions');

  remove(int index) {
    transactionListBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: transactionListBox.listenable(),
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: transactionListBox.length,
            itemBuilder: (BuildContext context, int index) {
              final data = transactionListBox.getAt(index)!;
              return SizedBox(
                height: 30,
                child: Card(
                  child: InkWell(
                    onTap: () => Get.snackbar(
                        'Data Diklik', 'Data ke ${index + 1} diklik'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Time: ${data.time}'),
                        Text('Date: ${data.date}}'),
                        Text('Quantity: ${data.quantity}'),
                        Text('Detail: ${data.detail}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
