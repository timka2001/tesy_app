import 'package:dio/dio.dart';

import 'constans.dart';
import 'model/offers_model.dart';
import 'model/tickets_model.dart';
import 'model/tickets_offers_model.dart';

class StudyNetApiClient {
  StudyNetApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: travelUrlNet,
        connectTimeout: Duration(seconds: 120000),
        receiveTimeout: Duration(seconds: 60000),
      ),
    );
  }
  late Dio _dio;
  Future<TicketsOffers> getTicketsOffers() async {
    try {
      final response = await _dio.get(ticketsOffersKey);
      print(response.data);
      if (response.statusCode == 200) {
        return TicketsOffers.fromJson(response.data);
      } else {
        // Обработка других статусов ответа, если необходимо
        throw Exception('Failed to load tickets offers');
      }
    } catch (e) {
      // Обработка ошибок
      print('Error loading tickets offers: $e');
      throw Exception('Failed to load tickets offers');
    }
  }

  Future<TicketsModel> getTickets() async {
    try {
      final response = await _dio.get(ticketsKey);
      if (response.statusCode == 200) {
        return TicketsModel.fromJson(response.data);
      } else {
        // Обработка других статусов ответа, если необходимо
        throw Exception('Failed to load tickets ');
      }
    } catch (e) {
      // Обработка ошибок
      print('Error loading tickets offers: $e');
      throw Exception('Failed to load tickets ');
    }
  }

  Future<Offers> getOffers() async {
    try {
      final response = await _dio.get(offersKey);
      if (response.statusCode == 200) {
        return Offers.fromJson(response.data);
      } else {
        // Обработка других статусов ответа, если необходимо
        throw Exception('Failed to load offers ');
      }
    } catch (e) {
      // Обработка ошибок
      print('Error loading tickets offers: $e');
      throw Exception('Failed to load offers ');
    }
  }
}
