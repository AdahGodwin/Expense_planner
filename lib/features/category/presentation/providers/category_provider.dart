import 'package:expense_manager/features/category/data/models/category.dart';
import 'package:expense_manager/shared/data/categorydata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<List<Category>> {
  CategoryNotifier() : super(categories);

  // Category addCategory(String categoryName) {

  // }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>((ref) {
  return CategoryNotifier();
});
