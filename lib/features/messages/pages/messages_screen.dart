import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/utils/helpers/app_helpers.dart';
import 'package:flutter_chat_app_gestream_io/data/models/messages/messages_model.dart';
import 'package:flutter_chat_app_gestream_io/features/messages/widgets/custom_message_tile.dart';
import 'package:flutter_chat_app_gestream_io/features/messages/widgets/custom_stories.dart';
import 'package:jiffy/jiffy.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: [
      const SliverToBoxAdapter(child: CustomStories()),
      SliverList(delegate: SliverChildBuilderDelegate(_delegate)),
    ],
  );

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = AppHelpers.randomDate();
    return CustomMessageTile(
      messageData: MessageData(
        senderName: faker.person.name(),
        message: faker.lorem.sentence(),
        messageDate: date,
        dateMessage: Jiffy.parseFromDateTime(date).fromNow(),
        profilePicture: AppHelpers.randomPictureUrl(),
      ),
    );
  }
}
