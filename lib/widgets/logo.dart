import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_constants/app_images.dart';

class AdBlipLogo extends StatelessWidget {
  final double height;
  final double width;
  const AdBlipLogo({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.logo),
        )
      ),
    );
  }
}
