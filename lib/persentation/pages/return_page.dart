import 'dart:math';

import 'package:code_con_fe/persentation/constan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReturnPage extends StatelessWidget {
  final String merchantOrderId;
  final String resultCode;
  final String reference;

  const ReturnPage(
      {super.key,
      required this.merchantOrderId,
      required this.resultCode,
      required this.reference});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20,
                max(0, MediaQuery.sizeOf(context).height - 300) / 2, 20, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svgs/codecon.svg',
                  height: 50,
                ),
                sizeBoxHight20,
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'Order ID',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secoundaryColor),
                    ),
                    Text(
                      merchantOrderId,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                sizeBoxHight5,
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'Reference',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secoundaryColor),
                    ),
                    Text(
                      reference,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                sizeBoxHight40,
                Text(
                  'Your Transaction Status',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade200,
                  ),
                ),
                Text(
                  switch (resultCode) {
                    '00' => 'Success',
                    '02' => 'Failed',
                    _ => 'Panding',
                  },
                  style: TextStyle(
                      fontSize: 18,
                      color: switch (resultCode) {
                        '00' => Colors.green.shade200,
                        '02' => Colors.red.shade200,
                        _ => Colors.yellow.shade200,
                      }),
                ),
                sizeBoxHight10,
                Text(
                  switch (resultCode) {
                    '00' => 'Thank You For Registering to our event.',
                    '02' => 'Please redo your registration.',
                    _ => 'Please pay with your chosen payment method.',
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade200),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
