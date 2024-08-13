import 'package:flutter/material.dart';
import 'package:evento_app/features/my_events/ui/widgets/my_events_appbar.dart';
import 'package:evento_app/features/my_events/ui/widgets/events_gridview.dart';
import 'package:evento_app/features/my_events/ui/widgets/event_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evento_app/features/event_integration/data/repositories/event_providers.dart';

class MyEventsScreen extends ConsumerWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventListAsyncValue = ref.watch(eventListProvider);
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: const MyEventsAppBar(),
        body: SingleChildScrollView(
          child: eventListAsyncValue.when(
            data: (events) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'This Month',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: events
                        .where((event) =>
                            event.startTime.month == DateTime.now().month)
                        .map((event) => SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: EventCard(isCreator: true, event: event)))
                        .toList(),
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        unselectedLabelColor:
                            Theme.of(context).textTheme.titleSmall!.color,
                        labelColor: Theme.of(context).primaryColor,
                        tabs: const [
                          Tab(
                            text: 'Upcoming',
                          ),
                          Tab(
                            text: 'Past',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: TabBarView(
                          children: [
                            EventsGridView(
                                events: events
                                    .where((event) =>
                                        event.startTime.isAfter(DateTime.now()))
                                    .toList()), //(upcoming events)
                            EventsGridView(
                                events: events
                                    .where((event) => event.startTime
                                        .isBefore(DateTime.now()))
                                    .toList()), //(past events)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ));
  }
}
