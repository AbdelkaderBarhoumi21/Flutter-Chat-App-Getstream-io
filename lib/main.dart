import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/app/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() async {
  await dotenv.load();

  final client = StreamChatClient(
    dotenv.env['GETSTREAM_API_KEY']!,
    logLevel: Level.INFO,
  );
  await client.connectUser(
    User(id: 'flutter_chat_app'),
    dotenv.env['GETSTREAM_TOKEN']!,
  );
  // We create a channel tailored for messaging.
  // 'messaging' is the channel type. Stream supports 4 pre-configured types:
  // 1. 'messaging': Standard chat (WhatsApp style) - supports read receipts and typing indicators.
  // 2. 'livestream': For massive audiences (Twitch style) - no read receipts, optimized for speed.
  // 3. 'team': For internal communication (Slack style).
  // 4. 'commerce': For customer support or transactions.
  // 'id': The unique identifier for this specific chat room.
  final channel = client.channel('messaging', id: 'flutterChatApp');
  runApp(MyApp(client: client, channel: channel));
}
