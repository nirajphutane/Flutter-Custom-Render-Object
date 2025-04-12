
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Box extends SingleChildRenderObjectWidget {

  final double? width, height;
  final EdgeInsets? padding;
  final Alignment? alignment;
  final BoxDecoration? decoration;

  const Box({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.alignment,
    this.decoration,
    super.child,
  });

  @override
  RenderObject createRenderObject(final BuildContext context) => RenderBoxObject(width, height, padding, alignment, decoration);

  @override
  void updateRenderObject(final BuildContext context, covariant RenderBoxObject renderObject) => renderObject
    ..width = width
    ..height = height
    ..padding = padding
    ..alignment = alignment
    ..decoration = decoration;
}

class RenderBoxObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {

  double? _width, _height;
  EdgeInsets? _padding;
  Alignment? _alignment;
  BoxDecoration? _decoration;

  RenderBoxObject(this._width, this._height, this._padding, this._alignment, this._decoration);

  set width(final double? value) {
    _width = value;
    markNeedsLayout();
  }

  set height(final double? value) {
    _height = value;
    markNeedsLayout();
  }

  set padding(final EdgeInsets? padding) {
    _padding = padding;
    markNeedsLayout();
  }

  set alignment(final Alignment? alignment) {
    _alignment = alignment;
    markNeedsLayout();
  }

  set decoration(final BoxDecoration? value) {
    _decoration = value;
    markNeedsPaint();
  }

  @override
  void setupParentData(final RenderBox child) {
    if (child.parentData is! BoxParentData) {
      child.parentData = BoxParentData();
    }
  }

  @override
  void performLayout() {
    final EdgeInsets padding = _padding?? EdgeInsets.zero;
    double width = _width?.clamp(0, constraints.maxWidth)?? constraints.maxWidth;
    double height = _height?.clamp(0, constraints.maxHeight)?? constraints.maxHeight;
    if (child != null) {
      child!.layout(BoxConstraints(minWidth: 0, minHeight: 0, maxWidth: width, maxHeight: height).deflate(padding), parentUsesSize: true);
      if(_width == null) { width = child!.size.width + padding.horizontal; }
      if(_height == null) { height = child!.size.height + padding.vertical; }
      (child!.parentData as BoxParentData).offset = Offset(padding.left, padding.top) + (_alignment?? Alignment.center).alongOffset(Offset(width - padding.horizontal - child!.size.width, height - padding.vertical - child!.size.height));
    } else {
      if(_width == null) { width = padding.horizontal; }
      if(_height == null) { height = padding.vertical; }
    }
    size = constraints.constrain(Size(width, height));
  }

  @override
  void paint(final PaintingContext context, final Offset offset) {
    if (_decoration != null) {
      _decoration!.createBoxPainter().paint(context.canvas, offset, ImageConfiguration(size: size));
    }

    if (child != null) {
      context.paintChild(child!, offset + (child!.parentData as BoxParentData).offset);
    }
  }
}
