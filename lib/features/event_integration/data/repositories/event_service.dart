import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class EventService {
  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');

  Future<Event> fetchEvent(DocumentSnapshot doc) async {
    return await Event.fromDocument(
        doc); 
  }

  Future<List<Event>> getEvents() async {
    try {
      final querySnapshot = await eventsCollection.get();
      List<DocumentSnapshot> documents = querySnapshot.docs;
      final events = Future.wait(documents.map((doc) => fetchEvent(doc)));
      // print('Events fetched: $events');
      return events;
    } catch (e) {
      // print('Error fetching events: $e');
      return [];
    }
  }
}
