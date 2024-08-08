import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  // final int id;
  final String type;

  Category({
    // required this.id,
    required this.type,
  });

  static Future<Category> fetchCategory(DocumentReference categoryRef) async {
    DocumentSnapshot categoryDoc = await categoryRef.get();
    return Category.fromFirestore(categoryDoc);
  }

  factory Category.fromFirestore(DocumentSnapshot categoryDoc) {
    final data = categoryDoc.data() as Map<String, dynamic>;
    return Category(
      // id: data.containsKey('id') ? data['id'] as int? ?? 0 : 0,
      type: data.containsKey('type')
          ? data['type'] as String? ?? 'unknown category'
          : 'unknown category',
    );
  }

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      // id: data.containsKey('id') ? data['id'] as int? ?? 0 : 0,
      type: data.containsKey('type')
          ? data['type'] as String? ?? 'unknown category'
          : 'unknown category',
    );
  }
}
