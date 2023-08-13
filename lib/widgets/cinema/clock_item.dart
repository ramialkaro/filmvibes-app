import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockItem extends StatelessWidget {
  final DateTime date;

  const ClockItem({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white30,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          padding: const EdgeInsets.all(6),
          child: Text(
            DateFormat("HH:mm").format(date),
          ),
        ),
      ),
    );
  }
}
