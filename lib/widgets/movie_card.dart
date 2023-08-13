import 'package:flutter/material.dart';
import 'package:filmvibes/widgets/movie_details.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final double offset;
  final String rating;

  const MovieCard({
    Key? key,
    required this.imageUrl,
    required this.rating,
    this.offset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MovieDetails(),
                ),
              );
            },
            child: Image.network(
              imageUrl,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 60,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    rating,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
