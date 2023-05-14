import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageNetwork({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(),
    );
  }
}
