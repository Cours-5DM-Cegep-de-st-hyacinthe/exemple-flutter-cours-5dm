import 'package:demo_chat/models/list_message_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VueChat extends StatelessWidget {
  const VueChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListMessageModel> (
      builder: (context, listMessageModel, child) {
        return Column(
          children: [
            for(var message in listMessageModel.messages) Row(
              key: Key(listMessageModel.messages.indexOf(message).toString()),
              children: [
                Text(message.alias),
                Text(": "),
                Text( message.message)
              ],)
          ]);
      }
    );
  }
}
