import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/widgets/agenda_section.dart';
import 'package:code_con_fe/persentation/widgets/brief_description_section.dart';
import 'package:code_con_fe/persentation/widgets/code_con_app_bar.dart';
import 'package:code_con_fe/persentation/widgets/footer_section.dart';
import 'package:code_con_fe/persentation/widgets/home_page_header.dart';
import 'package:code_con_fe/persentation/widgets/link_section.dart';
import 'package:code_con_fe/persentation/widgets/speaker_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CodeConAppBar(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            ListView(
              children: const [
                HomePageHeader(),
                sizeBoxHight60,
                BriefDescriptionSection(),
                SpeakerSection(),
                AgendaSection(),
                sizeBoxHight60,
                LinkSection(),
                FooterSection(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
