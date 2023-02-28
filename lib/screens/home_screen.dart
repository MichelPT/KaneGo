import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:michel_money/components/custom_header.dart';
import 'package:michel_money/components/totals.dart';
import 'package:michel_money/components/transactions_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: const TransactionList()),
            ],
          ),
        ),
      ),
    );
  }
}
