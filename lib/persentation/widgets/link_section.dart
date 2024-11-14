import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/extensions/build_context_extension.dart';
import 'package:code_con_fe/persentation/widgets/sosmed_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkSection extends StatelessWidget {
  const LinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: primaryColor,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: context.contentWidth >= 680 ? 600 : context.contentWidth - 80,
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: SvgPicture.asset('assets/svgs/codecon.svg'),
              ),
              sizeBoxHight10,
              const Text(
                'We began in 2015 with a simple idea: bring together the best minds around the world in the tech industry to shere their knowledge and insights with the comunity.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              sizeBoxHight30,
              const Wrap(
                spacing: 10,
                runSpacing: 20,
                children: [
                  SosmedIcons(platform: SosmedIcon.facebook),
                  SosmedIcons(platform: SosmedIcon.x),
                  SosmedIcons(platform: SosmedIcon.instagram),
                  SosmedIcons(platform: SosmedIcon.threads),
                  SosmedIcons(platform: SosmedIcon.telegram),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
