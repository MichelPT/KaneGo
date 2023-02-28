import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExpenseTotal extends StatefulWidget {
  const ExpenseTotal({super.key});

  @override
  State<ExpenseTotal> createState() => _ExpenseTotalState();
}

class _ExpenseTotalState extends State<ExpenseTotal> {
  final currentMonth = DateFormat("MMMM").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Bulan ${currentMonth.toUpperCase()}',
          style: TextStyle(fontSize: 4.h, color: Colors.white),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(2.h),
            width: 85.w,
            height: 8.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                SizedBox(
                  width: 1.5.h,
                ),
                Image.asset('assets/images/expense.png'),
                SizedBox(
                  width: 2.3.h,
                ),
                Text('Rp1000000',
                    style: TextStyle(
                        fontSize: 4.5.h, fontWeight: FontWeight.bold)),
              ],
            ))
      ],
    );
  }
}
