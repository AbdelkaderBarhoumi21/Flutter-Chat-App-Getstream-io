import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/features/screens/screens.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.client, required this.channel, super.key});
  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Chat App',
    home: HomeScreen(),
  );
}
