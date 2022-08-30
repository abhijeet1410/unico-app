import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppNetworkImage extends StatelessWidget {
  final String? id;
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final ImageWidgetBuilder? imageBuilder;
  final FilterQuality? filterQuality;
  final BlendMode? colorBlendMode;
  final Color? color;
  final Map<String, String>? httpHeaders;
  final Alignment? alignment;
  final Widget? placeholder;
  const AppNetworkImage(this.imageUrl,
      {this.id,
      this.fit,
      this.height,
      this.width,
      this.imageBuilder,
      this.color,
      this.alignment,
      this.colorBlendMode,
      this.filterQuality,
      this.httpHeaders,
      this.placeholder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeHolderWidget = placeholder ?? const _ImagePlaceholder();
    if (imageUrl?.isEmpty ?? true) return placeHolderWidget;
    final child = CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      fit: fit,
      width: width,
      height: height,
      imageBuilder: imageBuilder,
      color: color,
      alignment: alignment ?? Alignment.center,
      colorBlendMode: colorBlendMode,
      filterQuality: filterQuality ?? FilterQuality.medium,
      httpHeaders: httpHeaders,
      errorWidget: (c, s, d) => const _ImagePlaceholder(),
      placeholder: (context, url) => const _ImagePlaceholder(),
    );
    if (id == null) {
      return child;
    } else {
      return Hero(
        tag: id ?? UniqueKey().toString(),
        child: child,
      );
    }
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://via.placeholder.com/300/FFFFFF/000000/?text=BuySale",
      fit: BoxFit.cover,
    );
  }
}
