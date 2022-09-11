double computeOffset<T>({
  required List<double> sizes,
  required List<T?> items,
  T? current,
}) {
  if (sizes.isNotEmpty) {
    return sizes
        .getRange(0, items.indexOf(current))
        .toList()
        .fold<double>(0, (previousValue, element) => previousValue + element);
  } else {
    return 0;
  }
}
