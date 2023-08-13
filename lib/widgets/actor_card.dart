import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String imageUrl;
  final String actorName;

  const ActorCard({
    super.key,
    required this.imageUrl,
    required this.actorName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(actorName),
        ],
      ),
    );
  }
}
