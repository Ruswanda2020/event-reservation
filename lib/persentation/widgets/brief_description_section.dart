import 'dart:math';

import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/extensions/build_context_extension.dart';
import 'package:code_con_fe/persentation/providers/description_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BriefDescriptionSection extends ConsumerWidget {
  const BriefDescriptionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.end,
        children: element(context, ref),
      ),
    );
  }

  List<Widget> element(BuildContext context, WidgetRef ref) {
    double pictureWidth = 380;
    double textWidth = MediaQuery.sizeOf(context).width < 650
        ? context.contentWidth
        : min(context.contentWidth * 0.5 - 40, context.contentWidth - 420);
    return [
      SizedBox(
        width: max(context.contentWidth * 0.5 - 420, 0),
      ),
      SizedBox(
        width: textWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Seminar, Talks & Workshops',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              sizeBoxHight10,
              Text(
                ref.watch(codeConDescriptionProvider),
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: pictureWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Image.asset('assets/pngs/section_photo.png'),
        ),
      )
    ];
  }
}
