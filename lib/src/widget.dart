import 'dart:math';

import 'package:custom_sliding_segmented_control/src/animation_panel.dart';
import 'package:custom_sliding_segmented_control/src/compute_offset.dart';
import 'package:custom_sliding_segmented_control/src/measure_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Example:
///
/// ```dart
/// CustomSlidingSegmentedControl<int>(
///   fromMax: true,
///   children: {
///     1: Text('Segmentation'),
///     2: Text('Max'),
///   },
///   thumbDecoration: BoxDecoration(
///     color: Colors.white,
///     boxShadow: [
///       BoxShadow(
///         color: Colors.black.withOpacity(.3),
///         blurRadius: 4.0,
///         spreadRadius: 1.0,
///         offset: Offset(
///           0.0,
///           2.0,
///         ),
///       ),
///     ],
///   ),
///   onValueChanged: (int value) {
///     print(value);
///   },
/// ),
/// ```
///
/// * `isStretch` - stretches CustomSlidingSegmentedControl to full width
/// * `onValueChanged` - on change current segment
/// * `children` - segment items map
/// * `initialValue` - initial segment
/// * `duration` - speed animation panel
/// * `curve` - curve for animated panel
/// * `innerPadding` - inner padding
/// * `fromMax` - gets the largest element, while the rest of the elements get its size
/// * `fixedWidth` - fixed width items
/// * `padding` - item padding
/// * `clipBehavior` - for container
/// * `decoration` - for decoration main panel
/// * `thumbDecoration` - for decoraton animation panel
/// * `height` - height panel
class CustomSlidingSegmentedControl<T> extends StatefulWidget {
  const CustomSlidingSegmentedControl({
    Key? key,
    required this.children,
    required this.onValueChanged,
    this.initialValue,
    this.duration,
    this.curve = Curves.easeInOut,
    this.innerPadding = 2.0,
    this.padding = 12,
    this.fixedWidth,
    this.decoration = const BoxDecoration(color: CupertinoColors.systemGrey5),
    this.thumbDecoration = const BoxDecoration(color: Colors.white),
    this.isStretch = false,
    this.fromMax = false,
    this.clipBehavior = Clip.none,
    this.splashColor = Colors.transparent,
    this.splashFactory = NoSplash.splashFactory,
    this.highlightColor = Colors.transparent,
    this.height = 40,
  })  : assert(children.length != 0),
        super(key: key);
  final BoxDecoration? decoration;
  final BoxDecoration? thumbDecoration;
  final ValueChanged<T> onValueChanged;
  final Duration? duration;
  final Curve curve;
  final double innerPadding;
  final double padding;
  final double? fixedWidth;
  final Map<T, Widget> children;
  final bool isStretch;
  final T? initialValue;
  final bool fromMax;
  final Clip clipBehavior;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? highlightColor;
  final double? height;

  @override
  _CustomSlidingSegmentedControlState<T> createState() =>
      _CustomSlidingSegmentedControlState();
}

class _CustomSlidingSegmentedControlState<T>
    extends State<CustomSlidingSegmentedControl<T>> {
  T? current;
  double? height;
  double offset = 0.0;
  Map<T?, double> sizes = {};
  bool hasTouch = false;
  double? maxSize;

  @override
  void initState() {
    super.initState();
    final List<T?> _list = widget.children.keys.toList();
    final _index = _list.indexOf(widget.initialValue);
    final _keys = _list.toList();
    if (widget.initialValue != null) {
      current = _keys[_index];
    } else {
      current = _keys.first;
    }
  }

  void _calculateSize(Size v, MapEntry<T?, Widget> item) {
    height ??= v.height;
    final Map<T?, double> _temp = {};
    _temp.putIfAbsent(item.key, () => widget.fixedWidth ?? v.width);
    if (widget.initialValue != null && widget.initialValue == item.key) {
      final _offset = computeOffset<T>(
        current: current,
        items: widget.children.keys.toList(),
        sizes: sizes.values.toList(),
      );
      setState(() {
        offset = _offset;
      });
    }
    setState(() {
      sizes = {...sizes, ..._temp};
      if (widget.fromMax) {
        maxSize = sizes.values.toList().reduce(max);
      }
    });
  }

  void _onTapItem(MapEntry<T?, Widget> item) {
    if (!hasTouch) {
      setState(() => hasTouch = true);
    }
    setState(() => current = item.key);
    final List<T?> _keys = widget.children.keys.toList();
    final _offset = computeOffset<T>(
      current: current,
      items: _keys,
      sizes: sizes.values.toList(),
    );
    setState(() => offset = _offset);
    final _value = _keys[_keys.indexOf(current)]!;
    widget.onValueChanged(_value);
  }

  Widget segmentItem(MapEntry<T, Widget> item) {
    return InkWell(
      splashColor: widget.splashColor,
      splashFactory: widget.splashFactory,
      highlightColor: widget.highlightColor,
      // borderRadius: BorderRadius.circular(widget.radius),
      onTap: () {
        _onTapItem(item);
      },
      child: Container(
        height: widget.height,
        width: maxSize ?? widget.fixedWidth,
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        child: Center(child: item.value),
      ),
    );
  }

  Widget layout() {
    return Container(
      clipBehavior: widget.clipBehavior,
      decoration: widget.decoration,
      padding: EdgeInsets.all(widget.innerPadding),
      child: Column(
        children: [
          Stack(
            children: [
              AnimationPanel<T>(
                hasTouch: hasTouch,
                offset: offset,
                height: height,
                width: sizes[current],
                duration: widget.duration,
                curve: widget.curve,
                decoration: widget.thumbDecoration,
              ),
              Row(
                children: [
                  for (final item in widget.children.entries)
                    MeasureSize(
                      onChange: (v) {
                        _calculateSize(v, item);
                      },
                      child: widget.isStretch
                          ? Expanded(child: segmentItem(item))
                          : segmentItem(item),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.isStretch)
          Expanded(
            child: layout(),
          )
        else
          layout()
      ],
    );
  }
}
