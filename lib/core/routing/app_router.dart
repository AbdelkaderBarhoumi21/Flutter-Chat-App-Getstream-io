import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/routing/app_route_names.dart';
import 'package:flutter_chat_app_gestream_io/features/messages/pages/messages_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case AppRouteNames.chatScreen:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
    }
  }
}
