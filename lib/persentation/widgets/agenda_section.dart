import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/extensions/build_context_extension.dart';
import 'package:code_con_fe/persentation/providers/agenda_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgendaSection extends ConsumerWidget {
  const AgendaSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double textWidht = context.windowsSize == WindowsSize.compact
        ? context.contentWidth - 40
        : context.contentWidth / 2 - 40;

    MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet(
      h2: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      h3: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      em: const TextStyle(
          fontStyle: FontStyle.normal, fontWeight: FontWeight.w700),
      p: TextStyle(color: Colors.grey[800]),
    );

    return Column(
      children: [
        const Center(
          child: Text(
            'Our Agenda',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        sizeBoxHight20,
        Center(
          child: SizedBox(
            width: context.contentWidth - 40,
            child: Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                SizedBox(
                  width: textWidht,
                  child: MarkdownBody(
                    data: ref.watch(agendaProvider()),
                    styleSheet: markdownStyleSheet,
                  ),
                ),
                SizedBox(
                  width: textWidht,
                  child: MarkdownBody(
                    data: ref.watch(agendaProvider(day: 2)),
                    styleSheet: markdownStyleSheet,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
