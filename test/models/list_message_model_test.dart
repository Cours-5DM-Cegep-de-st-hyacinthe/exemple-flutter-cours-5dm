

import 'package:demo_chat/models/list_message_model.dart';
import 'package:demo_chat/models/messages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Constructeur', () {
    test('Constructeur par défaut', () {
      final listMessageModel = ListMessageModel();

      expect(listMessageModel.messages.length, 0);
    });
  });

  group('add', () {
    test('ajouter 1 message', () {
      final listMessageModel = ListMessageModel();

      final messageTest = Message(alias: "aliasTest", message: "messageTest");

      listMessageModel.add(messageTest);

      expect(listMessageModel.messages.length, 1);
      expect(listMessageModel.messages.first.message, "messageTest");
      expect(listMessageModel.messages.first.alias, "aliasTest");
    });
  });
}