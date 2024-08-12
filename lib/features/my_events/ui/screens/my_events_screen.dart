import 'package:flutter/material.dart';
import 'package:evento_app/features/my_events/ui/widgets/my_events_appbar.dart';
import 'package:evento_app/features/my_events/ui/widgets/events_gridview.dart';
import 'package:evento_app/features/my_events/ui/widgets/event_card.dart';

class MyEventsScreen extends StatelessWidget {
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: const MyEventsAppBar(),
        body: SingleChildScrollView(
          child: Column(
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
              // change this to a list of events happening this month
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: const EventCard(isCreator: true)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: const EventCard(isCreator: true)),
                    ],
                  )),
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
                        child: const TabBarView(
                          children: [
                            EventsGridView(), //change to EventsGridView(events: events) (upcoming events)
                            EventsGridView(), //change to EventsGridView(events: events) (past events)
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
