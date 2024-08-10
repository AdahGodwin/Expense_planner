import 'package:expense_manager/providers/filter_provider.dart';
import 'package:flutter/material.dart';

class Category {
  String name;
  Color color;
  IconData icon;
  Transaction type;

  Category({
    required this.name,
    required this.color,
    required this.icon,
    required this.type,
  });
}
