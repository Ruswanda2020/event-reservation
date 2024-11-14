import 'dart:math';

import 'package:code_con_fe/data/code_con_repository.dart';
import 'package:code_con_fe/data/domain/entities/reservation.dart';
import 'package:code_con_fe/data/domain/entities/tresult.dart';
import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/extensions/build_context_extension.dart';
import 'package:code_con_fe/persentation/providers/router_provider.dart';
import 'package:code_con_fe/persentation/widgets/code_con_app_bar.dart';
import 'package:code_con_fe/persentation/widgets/error_dialog.dart';
import 'package:code_con_fe/persentation/widgets/registration_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationStatusPage extends ConsumerStatefulWidget {
  const RegistrationStatusPage({super.key});

  @override
  ConsumerState<RegistrationStatusPage> createState() =>
      _RegistrationStatusPageState();
}

class _RegistrationStatusPageState
    extends ConsumerState<RegistrationStatusPage> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

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
              children: [
                Center(
                  child: SizedBox(
                    width: min(context.contentWidth - 40, 700),
                    child: Column(
                      children: [
                        sizeBoxHight60,
                        const Text(
                          'Please enter your email to check your registration status',
                          style: TextStyle(fontSize: 16),
                        ),
                        sizeBoxHight40,
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Your Email',
                            labelText: 'Email',
                          ),
                        ),
                        sizeBoxHight40,
                        isLoading
                            ? pingProgressIndicator
                            : ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(secoundaryColor),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  CodeConRepository()
                                      .checkReservation(emailController.text)
                                      .then((value) {
                                    switch (value) {
                                      case Success<Reservation>(:final data):
                                        if (context.mounted) {
                                          context.show(
                                            RegistrationStatusDialog(
                                                reservation: data),
                                          );
                                        }
                                      case Failure<Reservation>(:final message):
                                        if (context.mounted) {
                                          context.show(
                                            ErrorDialog(message: message),
                                          );
                                        }
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                },
                                child: const Text(
                                  'Check Registration',
                                  style: TextStyle(color: Colors.white),
                                )),
                        sizeBoxHight60,
                        const Text("Have't registered yet?"),
                        Wrap(
                          children: [
                            const Text('Please register '),
                            InkWell(
                              onTap: () {
                                ref.watch(routerProvider).goNamed('register');
                              },
                              child: const Text(
                                'Here',
                                style: TextStyle(color: secoundaryColor),
                              ),
                            )
                          ],
                        ),
                        sizeBoxHight10,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
