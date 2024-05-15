import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MeasureSize extends SingleChildRenderObjectWidget {
  final Function(Size size) onChange;

  const MeasureSize({
    Key? key,
    required Widget child,
    required this.onChange,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _SizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(BuildContext context, covariant _SizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

class _SizeRenderObject extends RenderProxyBox {
  Function(Size size) onChange;
  Size? _oldSize;

  _SizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();
    final Size newSize = child?.size ?? Size.zero;
    if (_oldSize == newSize) return;
    _oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}
