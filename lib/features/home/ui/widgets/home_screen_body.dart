import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evento_app/features/event_integration/data/repositories/event_providers.dart';
import 'package:evento_app/features/event_integration/data/repositories/category_providers.dart';

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventListAsyncValue = ref.watch(eventListProvider);
    final categoryListAsyncValue = ref.watch(categoryListProvider);
    return Column(
      children: [
        const Text('Events:', style: TextStyle(fontWeight: FontWeight.bold)),
        eventListAsyncValue.when(
          data: (events) => SizedBox(
            height: 350,
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(
                      'description: ${event.description} \n city: ${event.city} \n country: ${event.country} \n street: ${event.street} \n maxPrice: ${event.maxPrice} \n minPrice: ${event.minPrice} \n time: ${event.time} \n attendees: ${event.attendees} \n imagesUrl: ${event.imagesUrl} \n longitude: ${event.location.longitude}\n latitude: ${event.location.latitude} \n category: ${event.category.type}'),
                );
              },
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text('Categories:', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        categoryListAsyncValue.when(
          data: (categories) => SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category.type),
                );
              },
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ],
    );
  }
}
