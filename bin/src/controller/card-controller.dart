import 'dart:async';

import '../entities/card.dart';
import '../service/card-service.dart';

class CardController {
  var _service = CardService();

  Future<void> imprimir() async {
    var cards = await _service.getAll();
    for (var card in cards) {
      print(card);
    }
  }

  Future<void> buscarPorId(int cardId) async {
    var card = await _service.getCardById(cardId);
    print('Card com ID ${cardId}');
    print(card.toString());
  }

  Future<int> salvar(String title, String content) async {
    var card = Card(title: title, content: content);
    return await _service.save(card);
  }

  Future<int> atualizar(int id, String title, String content) async {
    var card = Card(id: id, title: title, content: content);
    return await _service.update(id, card);
  }

  Future<int> deletar(int id) async {
    return _service.delete(id);
  }
}
