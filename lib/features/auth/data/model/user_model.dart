import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String id;
  final String fullName;
  final String email;
  final String profileImage;
  final List<dynamic> events;
  final List<dynamic> favorites;

  const Account({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImage,
    required this.events,
    required this.favorites,
  });

  static Future<Account> fetchAccount(DocumentReference accountRef) async {
    DocumentSnapshot accountDoc = await accountRef.get();
    return Account.fromFirestore(accountDoc);
  }

  factory Account.fromFirestore(DocumentSnapshot accountDoc) {
    final data = accountDoc.data() as Map<String, dynamic>;
    return Account(
      id: data.containsKey('id')
          ? data['id'] as String? ?? 'some_id'
          : 'some_id',
      fullName: data.containsKey('fullName')
          ? data['fullName'] as String? ?? 'no name'
          : 'no name',
      email: data.containsKey('email')
          ? data['email'] as String? ?? 'no email'
          : 'no email',
      profileImage: data.containsKey('profileImage')
          ? data['profileImage'] as String? ?? 'no profileImage'
          : 'no profileImage',
      events: data.containsKey('events')
          ? data['events'] as List<dynamic>? ?? []
          : [],
      favorites: data.containsKey('favorites')
          ? data['favorites'] as List<dynamic>? ?? []
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'profileImage': profileImage,
        'events': events,
        'favorites': favorites,
      };
}
