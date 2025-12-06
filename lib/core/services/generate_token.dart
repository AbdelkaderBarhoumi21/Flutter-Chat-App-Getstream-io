import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  final secret = dotenv.env['GETSTREAM_SECRET_KEY'];
  final jwt = JWT({'user_id': 'flutter_chat_app'});

  final token = jwt.sign(SecretKey(secret!));

  // Write to a file so we can read it easily without copy-paste issues
  File('token_dart.txt').writeAsStringSync(token);
  debugPrint('Token generated and saved to token_dart.txt');
  debugPrint(token);
}
