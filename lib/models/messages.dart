class Message {
  const Message({this.id, required this.alias, required this.message});

  final int? id;
  final String alias;
  final String message;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alias': alias,
      'message': message
    };
  }

  Message.fromMap(Map<String, dynamic> messageMap):
    this.id = messageMap['id'],
    this.alias = messageMap['alias'],
    this.message = messageMap['message'];

  @override
  String toString() {
    return 'Message{id: $id, alias: $alias, message: $message}';
  }
}