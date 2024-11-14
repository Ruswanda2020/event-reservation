// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_method_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentMethodParams _$GetPaymentMethodParamsFromJson(
        Map<String, dynamic> json) =>
    GetPaymentMethodParams(
      amount: (json['amount'] as num?)?.toInt() ?? 10000,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$GetPaymentMethodParamsToJson(
        GetPaymentMethodParams instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'dateTime': instance.dateTime.toIso8601String(),
    };
