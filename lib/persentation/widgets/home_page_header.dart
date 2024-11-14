import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/extensions/build_context_extension.dart';
import 'package:code_con_fe/persentation/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePageHeader extends ConsumerWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          height: 340,
          width: double.infinity,
          color: primaryColor,
        ),
        Center(
          child: Wrap(
            children: [
              ...headerElements(context, ref),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> headerElements(BuildContext context, WidgetRef ref) {
    double elementWidht = (context.windowsSize == WindowsSize.compact
        ? context.contentWidth
        : context.contentWidth / 2);
    return [
      SizedBox(
        width: elementWidht,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              eventDate(),
              ...tagLine(),
              sizeBoxHight20,
              eventLocation(widht: elementWidht),
              eventPrice(),
              sizeBoxHight30,
              registerButton(ref),
              sizeBoxHight40,
            ],
          ),
        ),
      ),
      headerPicture(
        width: elementWidht,
      ),
    ];
  }

  Widget registerButton(WidgetRef ref) => ElevatedButton(
        onPressed: () {
          ref.watch(routerProvider).goNamed('register');
        },
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(secoundaryColor),
        ),
        child: const Text(
          'Register Now',
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget eventPrice() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            MdiIcons.ticketConfirmation,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(
            width: 9,
          ),
          const Text(
            'IDR 750.000',
            style: TextStyle(color: Colors.white),
          ),
        ],
      );

  Widget eventLocation({required double widht}) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            MdiIcons.mapMarkerRadius,
            color: Colors.white,
            size: 18,
          ),
          sizeBoxWidth5,
          SizedBox(
            width: widht - 65,
            child: const Text(
              ' Internation Bali Resort, Bali Indonesia',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );

  List<Widget> tagLine() => [
        const Text(
          'The Ultimate',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        const Text(
          'Event For Devlopers',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        )
      ];
  Widget eventDate() => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.white,
            size: 18,
          ),
          sizeBoxWidth5,
          Text(
            'Des 8 - 9, 2024',
            style: TextStyle(color: Colors.white),
          ),
        ],
      );

  Widget headerPicture({required width}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        height: 390,
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/pngs/header_bg.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
