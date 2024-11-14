import 'package:code_con_fe/data/code_con_repository.dart';
import 'package:code_con_fe/data/domain/duitku_entities/get_payment_method_params.dart';
import 'package:code_con_fe/data/domain/entities/payment_method.dart';
import 'package:code_con_fe/data/domain/entities/tresult.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'payment_method_provider.g.dart';

@Riverpod(keepAlive: true)
Future<TResult<List<PaymentMethod>>> paymentMethods(Ref ref) =>
    CodeConRepository()
        .getPaymentMethods(params: GetPaymentMethodParams(amount: 7500000));
