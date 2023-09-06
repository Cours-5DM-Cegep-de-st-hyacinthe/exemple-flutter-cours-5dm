import 'package:flutter/material.dart';

class VueEnvoyerMessage extends StatelessWidget {
  const VueEnvoyerMessage({
    super.key,
    required this.envoyerMessage
  });

  final Function envoyerMessage;


  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Row(
      children:[
        Expanded(child: TextField(
          controller: textController,
        )),
        IconButton(
            onPressed: () => envoyerMessage("Mon Nom", textController.text),
            icon: const Icon(Icons.send))
      ]
    );
  }
}

class VueEnvoyerMessageStatefull extends StatefulWidget {
  const VueEnvoyerMessageStatefull({super.key, required this.envoyerMessage});

  final Function envoyerMessage;

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
              onPressed: () => widget.envoyerMessage("Mon Nom", _textController.text),
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