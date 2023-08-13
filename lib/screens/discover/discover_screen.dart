import 'package:flutter/material.dart';
import 'package:filmvibes/widgets/movie_carousel.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTab("Playing This Month"),
              const SizedBox(width: 10),
              _buildTab("Upcoming"),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: MovieCarousel(),
          ),
          _buildDurationRow(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "John Wick Chapter 4",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTab("Action"),
              const SizedBox(width: 20),
              _buildTab("Adventure"),
              const SizedBox(width: 20),
              _buildTab("Comedy"),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildDurationRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.watch_later_outlined, color: Colors.grey, size: 22.0),
        SizedBox(width: 6.0),
        Text(
          "1:30 h",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white12,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
