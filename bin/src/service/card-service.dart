import 'package:dio/dio.dart';

import '../entities/card.dart';

final uri = 'https://api-cards-growdev.herokuapp.com/cards';
final dio = Dio(BaseOptions(baseUrl: uri));

class CardService {
  Future<List<Card>> getAll() async {
    final json = await dio.get('');
    final list = json.data as List;

    List<Card> cards = [];
    for (var element in list) {
      final card = Card.fromJson(element);
      cards.add(card);
    }

    return cards;
  }

  Future<Card> getCardById(int id) async {
    try {
      final json = await dio.get('/$id');
      final element = json.data;
      var card = Card.fromJson(element);
      return card;
    } catch (error) {
      print('[ERRO AO BUSCAR] $error');
    }
  }

  Future<int> save(Card card) async {
    try {
      final data = card.toJson();
      final response = await dio.post('', data: data);
      return response.statusCode;
    } catch (e) {
      print('[ERRO AO BUSCAR] $e');
    }
  }

  Future<int> update(int cardId, Card card) async {
    try {
      final data = card.toJson();
      final response = await dio.put('/$cardId', data: data);
      return response.statusCode;
    } catch (e) {
      print('[ERRO AO BUSCAR] $e');
    }
  }

  Future<int> delete(int cardId) async {
    try {
      final response = await dio.delete('/$cardId');
      return response.statusCode;
    } catch (e) {
      print('[ERRO AO BUSCAR] $e');
    }
  }
}
