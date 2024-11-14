import 'package:code_con_fe/data/domain/entities/speaker.dart';
import 'package:flutter/material.dart';

class SpeakerWidget extends StatelessWidget {
  final Speaker speaker;
  const SpeakerWidget({super.key, required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(speaker.photoUrl),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(
            textAlign: TextAlign.center,
            speaker.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(
            textAlign: TextAlign.center,
            '${speaker.title} at ${speaker.affiliation}',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
