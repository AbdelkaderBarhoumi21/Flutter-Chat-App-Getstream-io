
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
void main() {
  final secret =
      '2ubxchg7ewqqpvtdwts8279vuhsm28ef5fjx538z55j9dxf9qp8b962rxue2r7gc';
  final jwt = JWT({'user_id': 'flutter_chat_app'});

  final token = jwt.sign(SecretKey(secret), algorithm: JWTAlgorithm.HS256);

  // Write to a file so we can read it easily without copy-paste issues
  File('token_dart.txt').writeAsStringSync(token);
  debugPrint('Token generated and saved to token_dart.txt');
  debugPrint(token);
}
