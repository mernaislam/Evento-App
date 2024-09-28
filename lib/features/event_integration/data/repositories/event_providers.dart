import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'event_service.dart';
import '../models/event_model.dart';

final eventServiceProvider = Provider<EventService>((ref) {
  return EventService();
});


final eventListProvider = StreamProvider<List<Event>>((ref) async* {
  final stream = FirebaseFirestore.instance.collection('events').snapshots();

  await for (var querySnapshot in stream) {
    final List<Future<Event>> futureEvents = querySnapshot.docs.map((doc) {
      return Event.fromDocument(doc); 
    }).toList();

    final List<Event> events = await Future.wait(futureEvents);
    yield events;
  }
});