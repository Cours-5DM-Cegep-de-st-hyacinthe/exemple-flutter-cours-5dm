import 'package:demo_chat/models/list_message_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/messages.dart';

class VueEnvoyerMessage extends StatelessWidget {
  const VueEnvoyerMessage({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Row(
      children:[
        Expanded(child: TextField(
          controller: textController,
        )),
        IconButton(
            onPressed: () => Provider.of<ListMessageModel>(context, listen: false).add(Message(alias: "utilisateur1", message: textController.text)),
            icon: const Icon(Icons.send))
      ]
    );
  }
}

class VueEnvoyerMessageStatefull extends StatefulWidget {
  const VueEnvoyerMessageStatefull({super.key});

  @override
  State<StatefulWidget> createState() => _VueEnvoyerMessageStatefullState();
}

class _VueEnvoyerMessageStatefullState extends State<VueEnvoyerMessageStatefull> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:[
          Expanded(child: TextField(
            controller: _textController,
          )),
          IconButton(
              onPressed: () => Provider.of<ListMessageModel>(context, listen: false).add(Message(alias: "utilisateur1", message: _textController.text)),
              icon: const Icon(Icons.send))
        ]
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

}