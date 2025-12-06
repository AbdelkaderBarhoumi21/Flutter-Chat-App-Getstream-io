import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client, required this.channel});
  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      home: Center(child: Text('data')),
    );
  }
}
