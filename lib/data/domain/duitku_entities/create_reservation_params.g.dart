// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReservationParams _$CreateReservationParamsFromJson(
        Map<String, dynamic> json) =>
    CreateReservationParams(
      paymentMethod: json['paymentMethod'] as String,
      orderId: json['orderId'] as String,
      orderDescription: json['orderDescription'] as String? ?? '',
      customerName: json['customerName'] as String,
      customerEmail: json['customerEmail'] as String,
      retrunUrl: json['retrunUrl'] as String,
      expiryPeriod: (json['expiryPeriod'] as num?)?.toInt() ?? 15,
      totalPayment: (json['totalPayment'] as num).toInt(),
    );

Map<String, dynamic> _$CreateReservationParamsToJson(
        CreateReservationParams instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'orderId': instance.orderId,
      'orderDescription': instance.orderDescription,
      'customerName': instance.customerName,
      'customerEmail': instance.customerEmail,
      'retrunUrl': instance.retrunUrl,
      'expiryPeriod': instance.expiryPeriod,
      'totalPayment': instance.totalPayment,
    };
