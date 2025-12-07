import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/common/widgets/avatar/avatar.dart';
import 'package:flutter_chat_app_gestream_io/data/models/stories/stoires_model.dart';

class CustomStoryCard extends StatelessWidget {
  const CustomStoryCard({required this.storyData, super.key});

  final StoryData storyData;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Avatar.medium(url: storyData.url),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            storyData.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              letterSpacing: 0.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
