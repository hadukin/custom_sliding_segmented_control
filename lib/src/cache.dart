import 'package:flutter/material.dart';

class Cache<T> {
  final MapEntry<T?, Widget> item;
  final Size size;

  Cache({
    required this.item,
    required this.size,
  });
}
