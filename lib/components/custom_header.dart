import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  final dateTime = DateTime.now();
  final formattedDate =
      DateFormat("EEEEE, dd MMMM yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${greetings(dateTime)}, Michel",
            style: TextStyle(fontSize: 3.h, color: Colors.white),
          ),
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('M'),
          )
        ],
      ),
    );
  }
}

String greetings(dateTime) {
  if ((dateTime.hour) < 11 && (dateTime.hour) >= 4) {
    return "Selamat Pagi";
  } else if ((dateTime.hour) < 18 && (dateTime.hour) >= 11) {
    return "Selamat Siang";
  } else if ((dateTime.hour) < 23 && (dateTime.hour) >= 18) {
    return "Selamat Malam";
  } else {
    return "Waktunya tidur";
  }
}
