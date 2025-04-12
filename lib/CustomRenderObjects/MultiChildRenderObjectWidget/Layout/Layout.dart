
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

class Layout extends MultiChildRenderObjectWidget {

  Orientations orientation;
  Layout({super.key, super.children, this.orientation = Orientations.vertical});

  @override
  RenderObject createRenderObject(final BuildContext context) => LayoutBox(orientation);

  @override
  void updateRenderObject(final BuildContext context, covariant LayoutBox renderObject) => renderObject
    ..orientation = orientation;
}

class LayoutBox extends RenderBox with ContainerRenderObjectMixin<RenderBox, _LayoutParentData>, RenderBoxContainerDefaultsMixin<RenderBox, _LayoutParentData> {

  Orientations _orientation;
  LayoutBox(this._orientation);

  set orientation(final Orientations orientation) {
    _orientation = orientation;
    markNeedsLayout();
  }

  @override
  void setupParentData(final RenderBox child) {
    if (child.parentData is! _LayoutParentData) {
      child.parentData = _LayoutParentData();
    }
  }

  @override
  void performLayout() => size = constraints.constrain(_getSize(constraints, firstChild));

  Size _getSize(final BoxConstraints constraints, final RenderBox? child) {
    switch(_orientation) {
      case Orientations.vertical:
        return _getColumnSize(constraints, child);
      case Orientations.horizontal:
        return _getRowSize(constraints, child);
      case Orientations.stack:
        return _getStackSize(constraints, child);
    }
  }

  Size _getRowSize(final BoxConstraints constraints, RenderBox? child) {
    double width = 0, height = 0;
    while(child != null) {
      child.layout(constraints.loosen(), parentUsesSize: true);
      final _LayoutParentData parentData = (child.parentData as _LayoutParentData);
      parentData.offset = Offset(width, 0);
      width += child.size.width;
      height = max(height, child.size.height);
      child = parentData.nextSibling;
    }
    return Size(width, height);
  }

  Size _getColumnSize(final BoxConstraints constraints, RenderBox? child) {
    double width = 0, height = 0;
    while(child != null) {
      child.layout(constraints, parentUsesSize: true);
      final _LayoutParentData childParentData = (child.parentData as _LayoutParentData);
      childParentData.offset = Offset(0, height);
      height += child.size.height;
      width = max(width, child.size.width);
      child = childParentData.nextSibling;
    }
    return Size(width, height);
  }

  Size _getStackSize(final BoxConstraints constraints, RenderBox? child) {
    double width = 0, height = 0;
    while(child != null) {
      child.layout(constraints.loosen(), parentUsesSize: true);
      width = max(width, child.size.width);
      height = max(height, child.size.height);
      child = (child.parentData as _LayoutParentData).nextSibling;
    }
    return Size(width, height);
  }

  @override
  void paint(final PaintingContext context, final Offset offset) => _paint(offset, firstChild, (final Offset offset, final RenderBox child) {
    context.paintChild(child, offset);
  });

  void _paint(final Offset offset, RenderBox? child, final Function(Offset offset, RenderBox child) render) {
    switch(_orientation) {
      case Orientations.vertical || Orientations.horizontal:
        return _paintLinear(offset, child, render);
      case Orientations.stack:
        return _paintStack(offset, child, render);
    }
  }

  void _paintLinear(final Offset offset, RenderBox? child, final Function render) {
    while(child != null) {
      final _LayoutParentData parentData = (child.parentData as _LayoutParentData);
      render(offset + parentData.offset, child);
      child = parentData.nextSibling;
    }
  }

  void _paintStack(final Offset offset, RenderBox? child, final Function render) {
    while(child != null) {
      render(offset, child);
      child = (child.parentData as _LayoutParentData).nextSibling;
    }
  }
}

class _LayoutParentData extends ContainerBoxParentData<RenderBox> { }

enum Orientations {
  vertical,
  horizontal,
  stack
}