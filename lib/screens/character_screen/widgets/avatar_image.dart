import 'package:flutter/material.dart';
import 'package:simplecode_3/constants/app_assets.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage(
    String? image, {
    Key? key,
    this.margin,
    this.radius,
  }) : super(key: key);

  final EdgeInsets? margin;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(AppAssets.images.noAvatar),
        radius: radius,
      ),
    );
  }
}
