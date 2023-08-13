import 'package:flutter/material.dart';
import 'package:filmvibes/widgets/ticket.dart';

class TicketWrapper extends StatelessWidget {
  TicketWrapper({Key? key}) : super(key: key);

  final List<String> imageUrls = [
    "https://m.media-amazon.com/images/M/MV5BNjRlZmM0ODktY2RjNS00ZDdjLWJhZGYtNDljNWZkMGM5MTg0XkEyXkFqcGdeQXVyNjAwMjI5MDk@._V1_.jpg",
    "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
    "https://cps-static.rovicorp.com/2/Open/TMDB4/Program/48875731/_derived_jpg_q90_310x470_m0/48875731_Oppenheimer_TPAA_6_1669046351762_2.jpg",
  ];

  void _onImageTap(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Ticket()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => _onImageTap(context, imageUrls[0]),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: imageUrls.map((imageUrl) {
              return Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: 500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
