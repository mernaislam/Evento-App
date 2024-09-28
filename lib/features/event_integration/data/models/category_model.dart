import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id; // Add this line
  final String type;

  Category({
    required this.id, // Add this line
    required this.type,
  });

  static Future<Category> fetchCategory(DocumentReference categoryRef) async {
    DocumentSnapshot categoryDoc = await categoryRef.get();
    return Category.fromFirestore(categoryDoc);
  }

  factory Category.fromFirestore(DocumentSnapshot categoryDoc) {
    final data = categoryDoc.data() as Map<String, dynamic>;
    return Category(
      id: categoryDoc.id, // Add this line
      type: data.containsKey('type')
          ? data['type'] as String? ?? 'unknown category'
          : 'unknown category',
    );
  }

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      id: doc.id, // Add this line
      type: data.containsKey('type')
          ? data['type'] as String? ?? 'unknown category'
          : 'unknown category',
    );
  }
}
