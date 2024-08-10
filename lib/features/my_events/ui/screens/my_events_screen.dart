import 'package:flutter/material.dart';
import 'package:evento_app/features/my_events/ui/widgets/my_events_appbar.dart';
import 'package:evento_app/features/my_events/ui/widgets/event_card.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: const MyEventsAppBar(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 10, //change to events.length
        itemBuilder: (context, index) {
          return const EventCard(
              isCreator: true); //change to EventCard(event: events[index])
        },
      ),
    );
  }
}
