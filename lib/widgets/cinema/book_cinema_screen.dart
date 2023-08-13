import 'package:flutter/material.dart';

import 'cinema_screen_painter.dart';
import 'cinema_seat.dart';
import 'clock_item.dart';
import 'date_item.dart';
import 'legend_item.dart';

class BookCinemaScreen extends StatefulWidget {
  const BookCinemaScreen({Key? key}) : super(key: key);

  @override
  _BookCinemaScreenState createState() => _BookCinemaScreenState();
}

class _BookCinemaScreenState extends State<BookCinemaScreen> {
  DateTime selectedDate = DateTime.now();
  double totalPrice = 14.0;

  List<List<bool>> seatAvailability = [
    [true, true, false, false, true],
    [true, true, true, false, true],
    [false, false, true, true, true],
    [true, false, true, false, true],
    [true, true, false, true, false],
  ];

  List<List<bool>> seatSelection = List.generate(
    5,
    (_) => List.filled(5, false),
  );

  void updateTotalPrice() {
    double price = 0.0;
    for (int row = 0; row < seatSelection.length; row++) {
      for (int col = 0; col < seatSelection[row].length; col++) {
        if (seatSelection[row][col]) {
          price += 10.0;
        }
      }
    }
    setState(() {
      totalPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Kingdom'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCinemaScreen(),
          _buildScreenInfo(),
          _buildSeatGrid(),
          _buildLegend(),
          _buildTotalAndBuyButton(),
        ],
      ),
    );
  }

  Widget _buildCinemaScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 100),
          painter: CinemaScreenPainter(),
        ),
      ),
    );
  }

  Widget _buildScreenInfo() {
    return const Column(
      children: [
        Center(
          child: Text(
            "IMAX",
            style: TextStyle(color: Color(0xFFFF79C6), fontSize: 20),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSeatGrid() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: seatAvailability[0].length,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15,
          ),
          itemCount: seatAvailability.length * seatAvailability[0].length,
          itemBuilder: (context, index) {
            final row = index ~/ seatAvailability[0].length;
            final col = index % seatAvailability[0].length;

            return CinemaSeat(
              isAvailable: seatAvailability[row][col],
              isSelected: seatSelection[row][col],
              onTap: () {
                setState(() {
                  seatSelection[row][col] = !seatSelection[row][col];
                });
                updateTotalPrice();
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LegendItem(color: Colors.green.withOpacity(0.6), text: "Available"),
          const LegendItem(color: Color(0xFFFF79C6), text: "Selected"),
          const LegendItem(color: Color(0xFF44475A), text: "Reserved"),
        ],
      ),
    );
  }

  Widget _buildTotalAndBuyButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildHorizontalScrollableRow(_buildDateItem),
          _buildHorizontalScrollableRow(_buildClockItem),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${totalPrice.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Buy'),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHorizontalScrollableRow(Widget Function(int) itemBuilder) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = -3; i <= 3; i++) itemBuilder(i),
        ],
      ),
    );
  }

  Widget _buildDateItem(int offset) {
    final date = DateTime.now().add(Duration(days: offset));

    return DateItem(date: date);
  }

  Widget _buildClockItem(int offset) {
    final date = DateTime.now().add(Duration(minutes: offset * 30));

    return ClockItem(date: date);
  }
}
