import 'package:flutter/material.dart';
import 'package:evento_app/features/my_events/ui/widgets/event_card.dart';

class EventsGridView extends StatelessWidget {
  const EventsGridView({
    super.key,
    // required this.events,
  });

  // final List<Event> events;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: 10, //change to events.length
        itemBuilder: (context, index) {
          return const EventCard(
              isCreator: true,
              scale: 1); //change to EventCard(event: events[index])
        },
      ),
    );
  }
}
