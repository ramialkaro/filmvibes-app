import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: movieCards,
          options: CarouselOptions(
            height: 340,
            initialPage: _currentIndex,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: movieCards.map((movie) {
            int index = movieCards.indexOf(movie);
            return Container(
              width: 10,
              height: 20,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color(0xFFFF79C6)
                    : const Color(0xFF44475A),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// EXAMPLES
List<Widget> movieCards = [
  const MovieCard(
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/en/thumb/d/d0/John_Wick_-_Chapter_4_promotional_poster.jpg/220px-John_Wick_-_Chapter_4_promotional_poster.jpg",
    rating: "4",
  ),
  const MovieCard(
    imageUrl: "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
    rating: "4",
  ),
  const MovieCard(
    imageUrl:
        "https://cps-static.rovicorp.com/2/Open/TMDB4/Program/48875731/_derived_jpg_q90_310x470_m0/48875731_Oppenheimer_TPAA_6_1669046351762_2.jpg",
    rating: "2",
  ),
  const MovieCard(
    imageUrl:
        "https://cps-static.rovicorp.com/2/Open/Sony_Pictures_Television/Program/38047747/_derived_jpg_q90_310x470_m0/The_Traitor_PA_2x3_6_1584595346447_3.jpg",
    rating: "5",
  ),
];
