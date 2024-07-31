import 'package:firebase_database/firebase_database.dart';
import '../models/event_model.dart';

class EventService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<List<Event>> getEvents() async {
    final snapshot = await _database.child('events').get();
    if (snapshot.exists) {
      final Map<dynamic, dynamic> eventMap =
          snapshot.value as Map<dynamic, dynamic>;
      final List<Event> events = [];
      eventMap.forEach((key, value) {
        final event = Event.fromJson(Map<String, dynamic>.from(value));
        events.add(event);
      });
      return events;
    } else {
      return [];
    }
  }
}
