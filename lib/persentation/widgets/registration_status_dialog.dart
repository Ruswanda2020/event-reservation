import 'package:code_con_fe/data/domain/entities/reservation.dart';
import 'package:code_con_fe/persentation/constan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationStatusDialog extends StatelessWidget {
  final Reservation reservation;
  const RegistrationStatusDialog({super.key, required this.reservation});
  TextStyle get titleTextStyle =>
      const TextStyle(fontSize: 16, color: secoundaryColor);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(
        child: Text(
          'Registration Status',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      children: [
        ListTile(
          title: const Text('Email'),
          titleTextStyle: titleTextStyle,
          subtitle: Text(reservation.email),
        ),
        ListTile(
          title: const Text('Nama'),
          titleTextStyle: titleTextStyle,
          subtitle: Text(reservation.name),
        ),
        if (reservation.status != 'PAID')
          ListTile(
            title: const Text('Link for Payment'),
            titleTextStyle: titleTextStyle,
            subtitle: InkWell(
              onTap: () {
                launchUrl(Uri.parse(reservation.paymentUrl));
              },
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Text(
                reservation.paymentUrl,
                style: const TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: primaryColor),
              ),
            ),
          ),
        ListTile(
          title: const Text('Status'),
          titleTextStyle: titleTextStyle,
          subtitle: Text(
            reservation.status == 'PAID'
                ? 'Registered'
                : 'Waiting for Payment ',
            style: TextStyle(
                color: reservation.status == 'PAID'
                    ? Colors.green
                    : Colors.red[900]),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
