double computeOffset<T>({List<double> sizes, List<T> items, T current}) {
  final _offsets = sizes.toList().getRange(0, items.indexOf(current)).toList();
  if (_offsets.isNotEmpty) {
    final _offset = _offsets.reduce((value, element) => value + element);
    return _offset;
  } else {
    return 0;
  }
}
