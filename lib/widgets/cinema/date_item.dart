import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateItem extends StatelessWidget {
  final DateTime date;

  const DateItem({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(date),
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            DateFormat('dd').format(date),
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
