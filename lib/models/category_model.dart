import 'package:flutter/material.dart';

class CategoryModel {
  final String imagePath;

  final String categoryName;
  final VoidCallback onTap;

  CategoryModel(this.onTap, {required this.imagePath, required this.categoryName});
}