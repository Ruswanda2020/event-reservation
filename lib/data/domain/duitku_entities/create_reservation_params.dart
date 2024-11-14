import 'package:json_annotation/json_annotation.dart';

part 'create_reservation_params.g.dart';

@JsonSerializable()
class CreateReservationParams {
  CreateReservationParams({
    required this.paymentMethod,
    required this.orderId,
    this.orderDescription = '',
    required this.customerName,
    required this.customerEmail,
    required this.retrunUrl,
    this.expiryPeriod = 15,
    required this.totalPayment,
  });

  factory CreateReservationParams.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReservationParamsToJson(this);

  final String paymentMethod;
  final String orderId;
  final String orderDescription;
  final String customerName;
  final String customerEmail;
  final String retrunUrl;
  final int expiryPeriod;
  final int totalPayment;
}
