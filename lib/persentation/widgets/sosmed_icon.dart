import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SosmedIcon {
  facebook('assets/svgs/facebook.svg'),
  instagram('assets/svgs/instagram.svg'),
  telegram('assets/svgs/telegram.svg'),
  x('assets/svgs/x.svg'),
  threads('assets/svgs/threads.svg'),
  ;

  final String path;
  const SosmedIcon(this.path);
}

class SosmedIcons extends StatelessWidget {
  final SosmedIcon platform;
  final double size;
  final VoidCallback? onTap;
  const SosmedIcons(
      {super.key, required this.platform, this.size = 25, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          platform.path,
          height: size,
          width: size,
        ),
      ),
    );
  }
}
