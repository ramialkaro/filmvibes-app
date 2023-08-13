import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String? selectedFilter;
  final ValueChanged<String?> onFilterSelected;

  FilterWidget({
    Key? key,
    required this.selectedFilter,
    required this.onFilterSelected,
  }) : super(key: key);

  final List<String> filterOptions = [
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Thriller',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Fantasy',
    'Animation',
    'Family',
    'Documentary',
    'Crime',
    'Mystery',
    'Biography',
    'History',
    'War',
    'Music',
    'Western',
    'Sports'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filterOptions.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              backgroundColor:
                  isSelected ? const Color(0xFFFF79C6) : Colors.grey[900],
              label: Text(filter),
              onSelected: (isSelected) {
                onFilterSelected(isSelected ? filter : null);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
