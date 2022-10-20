import 'package:flutter/material.dart';

class Cache<T> {
  final MapEntry<T?, Widget> item;
  final Size size;

  Cache({
    required this.item,
    required this.size,
  });

  @override
  bool operator ==(Object other) {
    if (other is Cache) {
      return identical(size, other.size) && identical(item, other.item);
    }
    return false;
  }

  @override
  int get hashCode => size.hashCode ^ item.hashCode;
}
