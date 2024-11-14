import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/providers/speaker_provider.dart';
import 'package:code_con_fe/persentation/widgets/speaker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeakerSection extends ConsumerWidget {
  const SpeakerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: [
          const Text(
            "WHO'S SPEAKING ",
            style: TextStyle(
                color: secoundaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          const Text(
            'Speaker & Panelists',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          sizeBoxHight20,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: ref
                .watch(speakersProvider)
                .map(
                  (speaker) => SpeakerWidget(speaker: speaker),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
