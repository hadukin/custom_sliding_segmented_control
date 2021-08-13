import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/src/animation_panel.dart';
import 'package:custom_sliding_segmented_control/src/compute_offset.dart';
import 'package:custom_sliding_segmented_control/src/measure_size.dart';

class CustomSlidingSegmentedControl<T> extends StatefulWidget {
  const CustomSlidingSegmentedControl({
    Key? key,
    required this.children,
    this.onValueChanged,
    this.initialValue,
    this.duration,
    this.radius = 4.0,
    this.elevation = 2.0,
    this.backgroundColor = CupertinoColors.systemGrey4,
    this.thumbColor = CupertinoColors.white,
    this.textColor = Colors.black,
    this.curve = Curves.easeInOut,
    this.innerPadding = 2.0,
    this.padding = 12,
    this.fixedWidth,
    this.decoration,
    this.isStretch = false,
  })  : assert(children.length != 0),
        super(key: key);
  final BoxDecoration? decoration;
  final ValueChanged<T>? onValueChanged;
  final Duration? duration;
  final double radius;
  final double elevation;
  final Color backgroundColor;
  final Color thumbColor;
  final Color textColor;
  final Curve curve;
  final double innerPadding;
  final double padding;
  final double? fixedWidth;
  final Map<T, Widget> children;
  final bool isStretch;
  final T? initialValue;

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

  @override
  void initState() {
    super.initState();
    final List<T?> _list = widget.children.keys.toList();
    final _index = _list.indexOf(widget.initialValue);
    final _keys = _list.toList();
    if (widget.initialValue != null) {
      current = _keys[_index];
    } else {
      current = _keys[0];
    }
    offset = (widget.fixedWidth ?? 0) * _index;
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
    });
  }

  void _onTapItem(MapEntry<T?, Widget> item) {
    setState(() => current = item.key);
    final List<T?> _keys = widget.children.keys.toList();
    final _offset = computeOffset<T>(
      current: current,
      items: _keys,
      sizes: sizes.values.toList(),
    );
    setState(() => offset = _offset);
    final _value = _keys[_keys.indexOf(current)]!;
    if (widget.onValueChanged != null) {
      widget.onValueChanged!(_value);
    }
  }

  Widget layout() {
    return Container(
      decoration: widget.decoration ??
          BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(
              widget.radius != 0 ? widget.radius + 2 : widget.radius,
            ),
          ),
      padding: EdgeInsets.all(widget.innerPadding),
      child: Column(
        children: [
          Stack(
            children: [
              AnimationPanel<T>(
                offset: offset,
                height: height,
                width: sizes[current],
                duration: widget.duration,
                radius: widget.radius,
                elevation: widget.elevation,
                color: widget.thumbColor,
                curve: widget.curve,
              ),
              Row(
                children: [
                  for (final item in widget.children.entries)
                    MeasureSize(
                      onChange: (v) {
                        _calculateSize(v, item);
                      },
                      child: widget.isStretch
                          ? Expanded(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.circular(widget.radius),
                                onTap: () {
                                  _onTapItem(item);
                                },
                                child: Center(
                                  child: Container(
                                    width: widget.fixedWidth,
                                    padding: EdgeInsets.all(widget.padding),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(widget.radius),
                                    ),
                                    child: item.value,
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              borderRadius:
                                  BorderRadius.circular(widget.radius),
                              onTap: () {
                                _onTapItem(item);
                              },
                              child: Center(
                                child: Container(
                                  width: widget.fixedWidth,
                                  padding: EdgeInsets.all(widget.padding),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(widget.radius),
                                  ),
                                  child: item.value,
                                ),
                              ),
                            ),
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
