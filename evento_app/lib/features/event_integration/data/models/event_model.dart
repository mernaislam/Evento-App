import 'package:intl/intl.dart';
import 'category_model.dart';

class Event {
  final int id;
  final String title;
  final String description;
  final String time;
  final DateTime date;
  final double latitude;
  final double longitude;
  // final Category category;

  Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.date,
      required this.latitude,
      required this.longitude,
      // required this.category
      });

  factory Event.fromJson(Map<String, dynamic> json) {
    DateTime dateParsed;
    if (json.containsKey('date')) {
      try {
        final dateFormat = DateFormat('dd-MM-yyyy');
        dateParsed = dateFormat.parse(json['date']);
      } catch (e) {
        dateParsed = DateTime.parse('2021-01-01');
      }
    } else {
      dateParsed = DateTime.parse('2021-01-01');
    }
    return Event(
      id: json.containsKey('id') ? json['id'] as int? ?? 0 : 0,
      title: json.containsKey('title')
          ? json['title'] as String? ?? 'No title provided'
          : 'No title provided',
      description: json.containsKey('description')
          ? json['description'] as String? ?? 'No description'
          : 'No description provided',
      time: json.containsKey('time')
          ? json['time'] as String? ?? 'No time provided'
          : 'No time provided',
      date: dateParsed,
      latitude: json.containsKey('latitude')
          ? json['latitude'] as double? ?? 0.0
          : 0.0,
      longitude: json.containsKey('longitude')
          ? json['longitude'] as double? ?? 0.0
          : 0.0,
      // category: json.containsKey('category')
      //     ? Category.fromJson(json['category']) 
      //     : Category(id: 0, name: 'unknown category'),
    );
  }
}
