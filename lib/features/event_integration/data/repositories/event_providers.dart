import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'event_service.dart';
import '../models/event_model.dart';

final eventServiceProvider = Provider<EventService>((ref) {
  return EventService();
});

final eventListProvider = FutureProvider<List<Event>>((ref) async {
  final eventService = ref.read(eventServiceProvider);
  return eventService.getEvents();
});
