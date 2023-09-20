import 'package:demo_chat/database/database.dart';

import '../models/messages.dart';

class MessageControleur {
  Future<List<Message>> getMessages() async {
    var db = DatabaseHandler();
    List<Message> messages = [];

    List<Map<String, dynamic>>? listeMessage = await db.database?.query('Message');

    for(Map<String, dynamic> message in listeMessage!){
      messages.add(Message.fromMap(message));
    }

    return messages;
  }

  Future<void> sauvegarderMessage(String nomUtilisateur, String message) async {
    var db = DatabaseHandler();

    var nouveauMessage = Message(alias: nomUtilisateur, message: message);

    await db.database?.insert('Message', nouveauMessage.toMap());
  }
}