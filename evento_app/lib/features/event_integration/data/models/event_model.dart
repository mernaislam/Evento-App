import 'category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final int id;
  final String title;
  final String description;
  final String city;
  final String country;
  final String street;
  final int maxPrice;
  final int minPrice;
  final DateTime time;
  final Map<String, dynamic> attendees;
  final Map<String, dynamic> imagesUrl;
  final GeoPoint location;
  final Category category;

  Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.city,
      required this.country,
      required this.street,
      required this.maxPrice,
      required this.minPrice,
      required this.time,
      required this.attendees,
      required this.imagesUrl,
      required this.location,
      required this.category});

  static Future<Event> fromDocument(DocumentSnapshot doc) async {
    final data = doc.data() as Map<String, dynamic>;
    DateTime parsedTime;
    if (data.containsKey('time')) {
      try {
        Timestamp timestamp = data['time'];
        parsedTime = timestamp.toDate();
      } catch (e) {
        parsedTime = DateTime.parse('2021-01-01');
      }
    } else {
      parsedTime = DateTime.parse('2021-01-01');
    }
    DocumentReference categoryRef = data['category'] as DocumentReference;
    Category parsedCategory = await Category.fetchCategory(categoryRef);

    return Event(
        id: data.containsKey('id') ? data['id'] as int? ?? 0 : 0,
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
        time: parsedTime,
        attendees: data.containsKey('attendees')
            ? data['attendees'] as Map<String, dynamic>? ?? {}
            : {},
        imagesUrl: data.containsKey('images')
            ? data['images'] as Map<String, dynamic>? ?? {}
            : {},
        location: data.containsKey('location')
            ? data['location'] as GeoPoint? ?? const GeoPoint(0.0, 0.0)
            : const GeoPoint(0.0, 0.0),
        category: parsedCategory);
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
        'time': time,
        'attendees': attendees,
        'images': imagesUrl,
        'location': location,
        'category': category
      };
}
