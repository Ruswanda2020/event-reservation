import 'package:code_con_fe/data/domain/duitku_entities/create_reservation_params.dart';
import 'package:code_con_fe/data/domain/duitku_entities/get_payment_method_params.dart';
import 'package:code_con_fe/data/domain/entities/payment_method.dart';
import 'package:code_con_fe/data/domain/entities/reservation.dart';
import 'package:code_con_fe/data/domain/entities/tresult.dart';
import 'package:dio/dio.dart';

class CodeConRepository {
  final Dio _dio;
  final String baseUrl = 'https://code-con-mlanev7-rus-wanda.globeapp.dev/';

  CodeConRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<TResult<List<PaymentMethod>>> getPaymentMethods(
      {GetPaymentMethodParams? params}) async {
    try {
      final response = await _dio.post(
        '$baseUrl/getPaymentMethod',
        data: params?.toJson() ?? {},
      );

      final paymentMethod = (response.data['paymentFee'] as List)
          .map((m) => PaymentMethod.fromJson(m))
          .toList();

      return Success(paymentMethod);
    } on DioException catch (e) {
      return Failure('${e.response?.data ?? e.message}');
    }
  }

  Future<TResult<Reservation>> makingReservation(
      {required CreateReservationParams params}) async {
    try {
      final response = await _dio.post(
        '$baseUrl/makingReservation',
        data: params.toJson(),
      );

      final reservation = Reservation.fromJson(response.data['data']);
      return Success(reservation);
    } on DioException catch (e) {
      return Failure('${e.response?.data ?? e.message}');
    }
  }

  Future<TResult<Reservation>> checkReservation(String email) async {
    try {
      final response = await _dio.post(
        '$baseUrl/checkReservation',
        data: {
          'email': email,
        },
      );

      final reservation = Reservation.fromJson(response.data['data']);
      return Success(reservation);
    } on DioException catch (e) {
      return Failure('${e.response?.data ?? e.message}');
    }
  }
}
