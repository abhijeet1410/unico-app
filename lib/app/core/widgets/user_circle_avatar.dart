import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class UserCircleAvatar extends StatelessWidget {
  final String? userId;

  final String? imageUrl;
  final double radius;
  final ShapeBorder? shape;
  final Widget? placeholder;
  const UserCircleAvatar(this.imageUrl,
      {this.userId, this.placeholder, this.radius = 32, this.shape, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget placeholderWidget = placeholder ?? AvatarPlaceholder(radius: radius);

    if (imageUrl?.isEmpty ?? true) {
      return placeholderWidget;
    }
    return Hero(
      tag: userId ?? UniqueKey().toString(),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        imageBuilder: (context, provider) => Material(
          clipBehavior: Clip.antiAlias,
          shape: shape ?? const CircleBorder(),
          color: Colors.grey[300],
          child: Image(
            image: provider,
            fit: BoxFit.cover,
            height: radius * 2,
            width: radius * 2,
            errorBuilder: (c, s, d) => placeholderWidget,
          ),
        ),
        errorWidget: (c, s, d) => placeholderWidget,
        placeholder: (context, url) => placeholderWidget,
      ),
    );
  }
}

class AvatarPlaceholder extends StatelessWidget {
  final double? radius;
  final Color? backgroundColor, textColor;

  const AvatarPlaceholder(
      {Key? key, this.radius, this.backgroundColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: SvgPicture.asset(AppAssets.userPlaceholder),
    );
  }
}

class AvatarNamePlaceholder extends StatelessWidget {
  final String firstLetter;
  final double? size;
  final Color? backgroundColor, textColor;
  final ShapeBorder? shape;

  const AvatarNamePlaceholder(this.firstLetter,
      {Key? key,
      this.size = 32,
      this.backgroundColor,
      this.shape,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: shape ?? const CircleBorder(),
      color: backgroundColor,
      child: SizedBox.square(
        dimension: size,
        child: Center(
          child: Text(
            firstLetter.toUpperCase(),
            style: TextStyle(
                fontSize: (size ?? 10) / 2, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key, this.width, this.height}) : super(key: key);
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.placeholder,
      fit: BoxFit.cover,
      width: width ?? 54,
      height: height ?? 54,
    );
  }
}
