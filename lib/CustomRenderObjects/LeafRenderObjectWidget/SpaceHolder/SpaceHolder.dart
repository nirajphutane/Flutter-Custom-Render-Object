
import 'package:flutter/material.dart';

class SpaceHolder extends LeafRenderObjectWidget {

  final Size? size;
  final double? strokeWidth;
  final Color? color, strokeColor;

  const SpaceHolder({
    super.key,
    this.size,
    this.strokeWidth = 1,
    this.color = Colors.white,
    this.strokeColor = Colors.black
  });

  @override
  RenderObject createRenderObject(final BuildContext context) => SpaceHolderBox(size?.width, size?.height, strokeWidth!, color!, strokeColor!);

  @override
  void updateRenderObject(final BuildContext context, covariant SpaceHolderBox renderObject) => renderObject
    .._width = size?.width
    .._height = size?.height
    .._strokeWidth = strokeWidth!
    .._color = color!
    .._strokeColor = strokeColor!;
}

class SpaceHolderBox extends RenderBox {

  double? _width, _height;
  double _strokeWidth;
  Color _color, _strokeColor;

  SpaceHolderBox(this._width, this._height, this._strokeWidth, this._color, this._strokeColor);

  set width(final double value) {
    _width = value;
    markNeedsLayout();
  }

  set height(final double value) {
    _height = value;
    markNeedsLayout();
  }

  set strokeWidth(final double value) {
    _strokeWidth = value;
    markNeedsPaint();
  }

  set color(final Color color) {
    _color = color;
    markNeedsPaint();
  }

  set strokeColor(final Color color) {
    _strokeColor = color;
    markNeedsPaint();
  }

  @override
  void performLayout() => size = constraints.constrain(Size(_width?? constraints.maxWidth, _height?? constraints.maxHeight));

  @override
  void paint(final PaintingContext context, final Offset offset) => _paint(context.canvas, offset & size);

  void _paint(final Canvas canvas, final Rect rect) {
    final Paint paint = Paint()
      ..color = _color;
    canvas.drawRect(rect, paint);
    paint
      ..color = _strokeColor
      ..strokeWidth = _strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, paint);
    canvas.drawLine(rect.topLeft, rect.bottomRight, paint);
    canvas.drawLine(rect.topRight, rect.bottomLeft, paint);
  }
}