import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double _kLogoSize = 40;

class Logo extends StatelessWidget {
  final double? height, width;

  const Logo({
    super.key,
    this.height = _kLogoSize,
    this.width = _kLogoSize,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo_r5.svg',
      height: height,
      width: width,
    );
  }
}
