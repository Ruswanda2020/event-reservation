import 'dart:math';

import 'package:code_con_fe/data/code_con_repository.dart';
import 'package:code_con_fe/data/domain/duitku_entities/create_reservation_params.dart';
import 'package:code_con_fe/data/domain/entities/payment_method.dart';
import 'package:code_con_fe/data/domain/entities/reservation.dart';
import 'package:code_con_fe/data/domain/entities/tresult.dart';
import 'package:code_con_fe/persentation/constan.dart';
import 'package:code_con_fe/persentation/extensions/build_context_extension.dart';
import 'package:code_con_fe/persentation/providers/payment_method_provider.dart';
import 'package:code_con_fe/persentation/providers/router_provider.dart';
import 'package:code_con_fe/persentation/widgets/code_con_app_bar.dart';
import 'package:code_con_fe/persentation/widgets/error_dialog.dart';
import 'package:code_con_fe/persentation/widgets/registration_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  PaymentMethod? selectedPaymentMethod;
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
                          'Please fill in the form below to Register',
                          style: TextStyle(fontSize: 16),
                        ),
                        sizeBoxHight40,
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Your Email',
                            helperText: 'Your email is used for your unique '
                                'identifier. the same email address cannot be used '
                                'to register multipel times',
                            helperMaxLines: 2,
                            helperStyle: TextStyle(fontSize: 12),
                            labelText: 'Email',
                          ),
                        ),
                        sizeBoxHight20,
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Your full Name',
                            helperStyle: TextStyle(fontSize: 12),
                            labelText: 'Full Name',
                          ),
                        ),
                        sizeBoxHight20,
                        ref.watch(paymentMethodsProvider).when(
                            data: (data) => data.isSuccess
                                ? DropdownButton(
                                    items: data.asSuccess.data
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 75,
                                                  height: 25,
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  color: Colors.white,
                                                  child: e.image
                                                          .toUpperCase()
                                                          .contains('.SVG')
                                                      ? SvgPicture.network(
                                                          e.image)
                                                      : Image.network(e.image),
                                                ),
                                                Text(e.name)
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    hint: const Text('Select Payment Method'),
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPaymentMethod = value;
                                      });
                                    },
                                    value: selectedPaymentMethod,
                                  )
                                : Text(data.asFailure.message),
                            error: (error, stackTrace) => Text(
                                  error.toString(),
                                ),
                            loading: () => blueProgressIndicator),
                        sizeBoxHight40,
                        isLoading
                            ? pingProgressIndicator
                            : ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(secoundaryColor),
                                ),
                                onPressed: () {
                                  if (selectedPaymentMethod != null &&
                                      emailController.text.trim().isNotEmpty &&
                                      nameController.text.trim().isNotEmpty) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    final params = CreateReservationParams(
                                        paymentMethod:
                                            selectedPaymentMethod!.code,
                                        orderId:
                                            'RSV${DateTime.now().microsecondsSinceEpoch}',
                                        customerName: nameController.text,
                                        customerEmail: emailController.text,
                                        retrunUrl:
                                            'https://codecon-37959.web.app/return',
                                        totalPayment: 750000);

                                    CodeConRepository()
                                        .makingReservation(params: params)
                                        .then((value) {
                                      switch (value) {
                                        case Success<Reservation>(:final data):
                                          if (context.mounted) {
                                            context.show(
                                              RegistrationStatusDialog(
                                                  reservation: data),
                                            );
                                          }
                                          launchUrl(Uri.parse(data.paymentUrl),
                                              mode: LaunchMode
                                                  .externalApplication);
                                        case Failure<Reservation>(
                                            :final message
                                          ):
                                          {
                                            if (message ==
                                                'Email already registered') {
                                              if (context.mounted) {
                                                context.show(
                                                  const ErrorDialog(
                                                      message:
                                                          'Email already registered'),
                                                );
                                              }
                                            } else {
                                              CodeConRepository()
                                                  .checkReservation(
                                                      emailController.text)
                                                  .then((value) {
                                                switch (value) {
                                                  case Success<Reservation>(
                                                      :final data
                                                    ):
                                                    {
                                                      if (context.mounted) {
                                                        context.show(
                                                            RegistrationStatusDialog(
                                                                reservation:
                                                                    data));
                                                      }
                                                      launchUrl(
                                                          Uri.parse(
                                                              data.paymentUrl),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    }
                                                  case Failure<Reservation>():
                                                    {
                                                      if (context.mounted) {
                                                        context.show(
                                                          ErrorDialog(
                                                              message: message),
                                                        );
                                                      }
                                                    }
                                                }
                                              });
                                            }
                                          }
                                      }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                                  }
                                },
                                child: const Text(
                                  'Make Payment',
                                  style: TextStyle(color: Colors.white),
                                )),
                        sizeBoxHight60,
                        const Text('Have registered before?'),
                        const Text(
                            'Only want to check your registration status?'),
                        Wrap(
                          children: [
                            const Text('please click '),
                            InkWell(
                              onTap: () {
                                ref.watch(routerProvider).goNamed('check');
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
