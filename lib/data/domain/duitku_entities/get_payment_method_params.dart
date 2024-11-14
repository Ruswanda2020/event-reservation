import 'package:json_annotation/json_annotation.dart';
part 'get_payment_method_params.g.dart';

@JsonSerializable()
class GetPaymentMethodParams {
  GetPaymentMethodParams({this.amount = 10000, DateTime? dateTime})
      : dateTime = dateTime ?? DateTime.now();

  factory GetPaymentMethodParams.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentMethodParamsFromJson(json);
  final int amount;
  final DateTime dateTime;

  Map<String, dynamic> toJson() => _$GetPaymentMethodParamsToJson(this);
}
