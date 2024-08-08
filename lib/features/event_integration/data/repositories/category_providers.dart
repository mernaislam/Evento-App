import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_service.dart';
import '../models/category_model.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService();
});

final categoryListProvider = FutureProvider<List<Category>>((ref) async {
  final categoryService = ref.read(categoryServiceProvider);
  return categoryService.getCategories();
});
