import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/app/my_app.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() async {
  final client = StreamChatClient('zak4dz929w4e', logLevel: Level.INFO);
  await client.connectUser(
    User(id: 'flutter_chat_app'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZmx1dHRlcl9jaGF0X2FwcCIsImlhdCI6MTc2NTA0MDQyMX0.DGPcEZkr63GKFd0J1DvJIGVHVmuDmPnDG3Gaiwn6C6A',
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
