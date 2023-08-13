import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'ticket_card.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildTicketDetails(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        color: Colors.black,
        iconSize: 30,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      expandedHeight: 440.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "https://m.media-amazon.com/images/M/MV5BNjRlZmM0ODktY2RjNS00ZDdjLWJhZGYtNDljNWZkMGM5MTg0XkEyXkFqcGdeQXVyNjAwMjI5MDk@._V1_.jpg",
          fit: BoxFit.cover,
        ),
      ),
      pinned: false,
      floating: false,
      snap: false,
    );
  }

  Widget _buildTicketDetails() {
    return SliverToBoxAdapter(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "MISSION IMPOSSIBLE: FALLOUT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketCard(
                    title: "Hall",
                    value: "Lux",
                  ),
                  TicketCard(
                    title: "Row",
                    value: "A2, A3",
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketCard(
                    title: "Date",
                    value: "28.12.2023",
                  ),
                  TicketCard(
                    title: "Time",
                    value: "20:00",
                  ),
                ],
              ),
              const Divider(
                endIndent: 0.2,
                indent: 1,
                color: Colors.white54,
              ),
              const SizedBox(height: 10),
              BarcodeWidget(
                color: const Color(0xff44475A),
                height: 60,
                data: "077099882992",
                drawText: false,
                barcode: Barcode.upcA(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
