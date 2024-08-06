import 'package:evento_app/features/event_details/ui/widgets/bottom_sticky_button.dart';
import 'package:evento_app/features/event_details/ui/widgets/custom_app_bar.dart';
import 'package:evento_app/features/event_details/ui/widgets/event_description.dart';
import 'package:evento_app/features/event_details/ui/widgets/event_location.dart';
import 'package:evento_app/features/event_details/ui/widgets/event_title.dart';
import 'package:evento_app/features/event_details/ui/widgets/image_slider.dart';
import 'package:evento_app/features/event_details/ui/widgets/initial_event_details.dart';
import 'package:evento_app/features/event_details/ui/widgets/organizer_data.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const ImageSlider(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------- Add Event Title here, category and going -------
                  const EventTitle(
                    title: 'National Music Festival',
                    categoryName: 'Music',
                    going: ['merna', 'islam'], // modify to be list of users
                  ),
                  const Divider(),
                  // ------- Add Event Title here, category and going -------
                  const InitialEventDetails(
                    date: 'Monday, December 24, 2024',
                    time: '18.00 - 23.00 PM (GMT +07:00)',
                    street: 'Grand City St. 100',
                    city: 'New York',
                    country: 'United States',
                    minPrice: 20.00,
                    maxPrice: 100.00,
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  // ------- TODO: pass in the argument the oragnizer data -------
                  const EventOrganizerData(),
                  const SizedBox(height: 10),
                  Text(
                    'About Event',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ------- Add event description here --------
                  const EventDescription(
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ------- TODO: Pass location arguments and implement maps API -------
                  const EventLocation(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomStickyButton(),
    );
  }
}
