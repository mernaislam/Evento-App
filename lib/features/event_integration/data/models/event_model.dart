import 'package:evento_app/features/auth/data/model/user_model.dart';

import 'category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final String city;
  final String country;
  final String street;
  final int maxPrice;
  final int minPrice;
  final DateTime startTime;
  final DateTime endTime;
  final List<dynamic> attendees;
  final List<dynamic> imagesUrl;
  final GeoPoint location;
  final Category category;
  final Account organizer;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.city,
    required this.country,
    required this.street,
    required this.maxPrice,
    required this.minPrice,
    required this.startTime,
    required this.endTime,
    required this.attendees,
    required this.imagesUrl,
    required this.location,
    required this.category,
    required this.organizer,
  });

  static Future<Event> fromDocument(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    DateTime parsedStartTime;
    DateTime parsedEndTime;
    if (data.containsKey('startTime')) {
      try {
        Timestamp timestamp = data['startTime'];
        parsedStartTime = timestamp.toDate();
      } catch (e) {
        parsedStartTime = DateTime.parse('2021-01-01');
      }
    } else {
      parsedStartTime = DateTime.parse('2021-01-01');
    }
    if (data.containsKey('endTime')) {
      try {
        Timestamp timestamp = data['endTime'];
        parsedEndTime = timestamp.toDate();
      } catch (e) {
        parsedEndTime = DateTime.parse('2021-01-01');
      }
    } else {
      parsedEndTime = DateTime.parse('2021-01-01');
    }
    DocumentReference categoryRef = data['category'] as DocumentReference;
    Category parsedCategory = await Category.fetchCategory(categoryRef);

    DocumentReference accountRef = data['organizer'] as DocumentReference;
    Account parsedAccount = await Account.fetchAccount(accountRef);
    return Event(
      id: data.containsKey('id') ? data['id'] as String? ?? '0' : '0',
      title: data.containsKey('title')
          ? data['title'] as String? ?? 'No title provided'
          : 'No title provided',
      description: data.containsKey('description')
          ? data['description'] as String? ?? 'No description'
          : 'No description provided',
      city: data.containsKey('city')
          ? data['city'] as String? ?? 'No city provided'
          : 'No city provided',
      country: data.containsKey('country')
          ? data['country'] as String? ?? 'No country provided'
          : 'No country provided',
      street: data.containsKey('street')
          ? data['street'] as String? ?? 'No street provided'
          : 'No street provided',
      maxPrice:
          data.containsKey('maxPrice') ? data['maxPrice'] as int? ?? 0 : 0,
      minPrice:
          data.containsKey('minPrice') ? data['minPrice'] as int? ?? 0 : 0,
      startTime: parsedStartTime,
      endTime: parsedEndTime,
      attendees: data.containsKey('attendees')
          ? data['attendees'] as List<dynamic>? ?? []
          : [],
      imagesUrl: data.containsKey('images')
          ? data['images'] as List<dynamic>? ?? []
          : [],
      location: data.containsKey('location')
          ? data['location'] as GeoPoint? ?? const GeoPoint(0.0, 0.0)
          : const GeoPoint(0.0, 0.0),
      category: parsedCategory,
      organizer: parsedAccount,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'city': city,
        'country': country,
        'street': street,
        'maxPrice': maxPrice,
        'minPrice': minPrice,
        'startTime': startTime,
        'endTime': endTime,
        'attendees': attendees,
        'images': imagesUrl,
        'location': location,
        'category': FirebaseFirestore.instance.collection('categories').doc(category.id),
        'organizer': FirebaseFirestore.instance.collection('users').doc(organizer.id),
      };
}
