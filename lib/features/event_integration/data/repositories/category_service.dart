import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class CategoryService {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  Future<List<Category>> getCategories() async {
    try {
      final querySnapshot = await categoryCollection.get();
      final categories = querySnapshot.docs.map((doc) => Category.fromDocument(doc)).toList();
      // print('Categories fetched: $categories');
      return categories;
    } catch (e) {
      // print('Error fetching Categories: $e');
      return [];
    }
  }
}
