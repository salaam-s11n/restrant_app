// ignore_for_file: invalid_required_positional_param

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String image;

  const Category({
    @required this.image,
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
