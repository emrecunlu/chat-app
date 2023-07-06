import 'package:flutter/material.dart';

class FormIllustration extends StatelessWidget {
  final String path;
  final double height;
  const FormIllustration({super.key, required this.path, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.contain,
      height: height,
      image: AssetImage(path),
    );
  }
}
