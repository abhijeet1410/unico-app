import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';

class FilledTabIndicator extends Decoration {
  const FilledTabIndicator({
    this.borderRadius,
    this.borderSide =
        const BorderSide(width: 4.0, color: AppColors.brightPrimary),
    this.insets = EdgeInsets.zero,
  });

  final BorderRadius? borderRadius;

  final BorderSide borderSide;

  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is FilledTabIndicator) {
      return FilledTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is FilledTabIndicator) {
      return FilledTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, borderRadius, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.top,
      // indicator.bottom - borderSide.width,
      indicator.width,
      indicator.bottom,
      // borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    if (borderRadius != null) {
      return Path()
        ..addRRect(
            borderRadius!.toRRect(_indicatorRectFor(rect, textDirection)));
    }
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(
    this.decoration,
    this.borderRadius,
    super.onChanged,
  );

  final FilledTabIndicator decoration;
  final BorderRadius? borderRadius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Paint paint;
    final Rect box = decoration._indicatorRectFor(rect, textDirection);
    canvas.drawRRect(
        RRect.fromRectAndCorners(box,
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        Paint()..color = AppColors.brightPrimary.shade50);
    if (borderRadius != null) {
      paint = Paint()..color = decoration.borderSide.color;
      final Rect indicator = decoration._indicatorRectFor(rect, textDirection);
      final RRect rrect = RRect.fromRectAndCorners(
        indicator,
        topLeft: borderRadius!.topLeft,
        topRight: borderRadius!.topRight,
        bottomRight: borderRadius!.bottomRight,
        bottomLeft: borderRadius!.bottomLeft,
      );
      canvas.drawRRect(rrect, paint);
    } else {
      paint = decoration.borderSide.toPaint()..strokeCap = StrokeCap.square;
      final Rect indicator = decoration
          ._indicatorRectFor(rect, textDirection)
          .deflate(decoration.borderSide.width / 2.0);
      canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
    }
  }
}
