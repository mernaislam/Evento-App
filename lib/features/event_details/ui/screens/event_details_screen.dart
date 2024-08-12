import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_app/features/event_details/ui/widgets/bottom_sticky_button.dart';
import 'package:evento_app/features/event_details/ui/widgets/custom_app_bar.dart';
import 'package:evento_app/features/event_details/ui/widgets/event_description.dart';
import 'package:evento_app/features/event_details/ui/widgets/event_location.dart';
import 'package:evento_app/features/event_details/ui/widgets/event_title.dart';
import 'package:evento_app/features/event_details/ui/widgets/image_slider.dart';
import 'package:evento_app/features/event_details/ui/widgets/initial_event_details.dart';
import 'package:evento_app/features/event_details/ui/widgets/organizer_data.dart';
import 'package:evento_app/features/event_integration/data/models/event_model.dart';
import 'package:evento_app/features/event_integration/data/repositories/event_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  Future<Event> getData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('events')
        .doc('ZlOjFbVBb3nGLpsdr7aP') // TODO: Pass event id here
        .get();

    final userData = EventService().fetchEvent(snapshot);
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          controller: scrollController,
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Text('No data found');
              } else {
                Event event = snapshot.data!;
                return Column(
                  children: [
                    ImageSlider(
                      images: event.imagesUrl,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EventTitle(
                            title: event.title,
                            categoryName: event.category.type,
                            going: event.attendees,
                          ),
                          const Divider(),
                          InitialEventDetails(
                            startTime: event.startTime,
                            endTime: event.endTime,
                            street: event.street,
                            city: event.city,
                            country: event.country,
                            minPrice: event.minPrice,
                            maxPrice: event.maxPrice,
                          ),
                          const Divider(),
                          const SizedBox(height: 10),
                          EventOrganizerData(
                            oragnizer: event.organizer,
                          ),
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
                          EventDescription(
                            description: event.description,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          EventLocation(
                            location: event.location,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomStickyButton(),
    );
  }
}
