import 'package:flutter/material.dart';
import 'package:filmvibes/widgets/actor_card.dart';
import 'cinema/book_cinema_screen.dart';
import 'info_widget.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Movie Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMovieHeader(),
            const SizedBox(height: 16),
            _buildMovieTitle(),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            _buildMovieDescription(),
            const SizedBox(height: 16),
            _buildActorList(),
            const SizedBox(height: 16),
            _buildReservationButton(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "https://m.media-amazon.com/images/M/MV5BNjRlZmM0ODktY2RjNS00ZDdjLWJhZGYtNDljNWZkMGM5MTg0XkEyXkFqcGdeQXVyNjAwMjI5MDk@._V1_.jpg",
            fit: BoxFit.fitHeight,
            height: 340,
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoWidget(
                icon: Icons.video_chat_rounded,
                title: "Genre",
                value: "Action"),
            SizedBox(height: 20),
            InfoWidget(
                icon: Icons.access_time_rounded,
                title: "Duration",
                value: "2h 15m"),
            SizedBox(height: 20),
            InfoWidget(
                icon: Icons.star_rate_sharp, title: "Rating", value: "4.5"),
          ],
        ),
      ],
    );
  }

  Widget _buildMovieTitle() {
    return const Text(
      "MISSION:IMPOSSIBLE FALLOUT",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMovieDescription() {
    return const Text(
      "Käännetty englannista-Mission: Impossible – Dead Reckoning Part Two on tuleva amerikkalainen toimintavakoiluelokuva, jonka on kirjoittanut ja ohjannut Christopher McQuarrie. Se on suora jatko-osa Mission: Impossible – Dead Reckoning Part One -elokuvalle ja kahdeksas osa Mission: Impossible -elokuvasarjassa. Wikipedia (englanti)",
      style: TextStyle(fontSize: 16, color: Colors.white38),
    );
  }

  Widget _buildActorList() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActorCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Tom_Cruise_by_Gage_Skidmore_2.jpg/220px-Tom_Cruise_by_Gage_Skidmore_2.jpg",
            actorName: "Tom Cruise",
          ),
          ActorCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Henry_Cavill_%2848417913146%29_%28cropped%29.jpg/220px-Henry_Cavill_%2848417913146%29_%28cropped%29.jpg",
            actorName: "Henry Cavill",
          ),
          ActorCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Ving_Rhames_2010_%284710601891%29_%28cropped%29.jpg/220px-Ving_Rhames_2010_%284710601891%29_%28cropped%29.jpg",
            actorName: "Ving Rhames",
          ),
          ActorCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Simon_Pegg_Premiere_of_Kill_Me_Three_Times_%28cropped%29.jpg/220px-Simon_Pegg_Premiere_of_Kill_Me_Three_Times_%28cropped%29.jpg",
            actorName: "Simon Pegg",
          ),
          ActorCard(
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Rebecca_Ferguson_in_2018.jpg/220px-Rebecca_Ferguson_in_2018.jpg",
            actorName: "Rebecca Ferguson",
          ),
        ],
      ),
    );
  }

  Widget _buildReservationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookCinemaScreen(),
            ),
          );
        },
        child: const Text("Get Reservation"),
      ),
    );
  }
}
