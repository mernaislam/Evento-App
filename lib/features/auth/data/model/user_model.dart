import 'package:evento_app/features/event_integration/data/models/event_model.dart';

class Account {
  final String id;
  final String fullName;
  final String email;
  final String profileImage;
  final List<Event> events;
  final List<Event> favorites;

  const Account({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImage,
    required this.events,
    required this.favorites,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'profileImage': profileImage,
        'events': events,
        'favorites': favorites,
      };
}
