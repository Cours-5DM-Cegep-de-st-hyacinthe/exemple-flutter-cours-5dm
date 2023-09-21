import 'package:hive/hive.dart';

// Rouler commande 'flutter packages pub run  build_runner build'

part 'messages.g.dart';

@HiveType(typeId: 1)
class Message {
  Message({required this.alias, required this.message});

  @HiveField(0)
  final String alias;
  
  @HiveField(1)
  final String message;
}