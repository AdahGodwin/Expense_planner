import 'package:flutter/material.dart';

class Category {
  String categoryId;
  String userId;
  String categoryName;
  IconData icon;

  Category({
    required this.categoryId,
    required this.userId,
    required this.categoryName,
    required this.icon,
  });
}
