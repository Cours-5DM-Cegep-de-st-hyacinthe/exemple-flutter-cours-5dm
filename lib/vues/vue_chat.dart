import 'package:flutter/material.dart';

import 'package:demo_chat/models/messages.dart';

class VueChat extends StatelessWidget {
  const VueChat({super.key, required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(var message in messages) Row(
          key: Key(messages.indexOf(message).toString()),
          children: [
            Text(message.alias),
            Text(": "),
            Text( message.message)
          ],)
    ]);
  }
}
