import 'package:flutter/material.dart';
import 'package:filmvibes/widgets/movie_carousel.dart';
import '../../widgets/filter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedFilter;

  void _onFilterSelected(String? filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Film Vibes",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(
              hintText: 'John Wick...',
              leading: const Icon(
                Icons.search,
                color: Color(0xFF282A36),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
            const SizedBox(height: 16),
            FilterWidget(
              selectedFilter: selectedFilter,
              onFilterSelected: _onFilterSelected,
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trailers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: MovieCarousel(),
            ),
          ],
        ),
      ),
    );
  }
}
