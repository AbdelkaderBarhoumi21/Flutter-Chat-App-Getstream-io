import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_gestream_io/core/themes/app_theme.dart';
import 'package:flutter_chat_app_gestream_io/core/utils/helpers/app_helpers.dart';
import 'package:flutter_chat_app_gestream_io/data/models/stories/stoires_model.dart';
import 'package:flutter_chat_app_gestream_io/features/messages/widgets/custom_story_card.dart';

class CustomStories extends StatelessWidget {
  const CustomStories({super.key});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    child: SizedBox(
      height: 134,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
            child: Text(
              'Stories',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: AppColors.textFaded,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final fakeDate = Faker();
                return SizedBox(
                  width: 60,
                  child: CustomStoryCard(
                    storyData: StoryData(
                      name: fakeDate.person.name(),
                      url: AppHelpers.randomPictureUrl(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
