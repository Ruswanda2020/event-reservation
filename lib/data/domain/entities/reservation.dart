class Reservation {
  final String orderId;
  final String email;
  final String name;
  final String status;
  final String paymentUrl;

  Reservation._({
    required this.orderId,
    required this.email,
    required this.name,
    required this.status,
    required this.paymentUrl,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation._(
      orderId: json['Order ID'].toString(),
      email: json['Email'].toString(),
      name: json['Name'].toString(),
      status: json['Status'].toString(),
      paymentUrl: json['Payment URL'].toString(),
    );
  }
}
