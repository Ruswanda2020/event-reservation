class PaymentMethod {
  final String code;
  final String name;
  final String image;
  final int fee;

  PaymentMethod._({
    required this.code,
    required this.name,
    required this.image,
    required this.fee,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod._(
      code: json['paymentMethod'].toString(),
      name: json['paymentName'].toString(),
      image: json['paymentImage'].toString(),
      fee: int.tryParse('${json['totalFee']}') ?? 0,
    );
  }
}
