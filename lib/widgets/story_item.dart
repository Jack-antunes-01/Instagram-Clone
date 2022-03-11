import 'package:flutter/material.dart';
import 'package:instagram_clone/theme/colors.dart';
import 'package:instagram_clone/widgets/box_story.dart';

class StoryItem extends StatelessWidget {
  final String img;
  final String name;

  const StoryItem({
    Key? key,
    required this.img,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
      child: Column(
        children: [
          BoxStory(image: img),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 70,
            child: Text(
              name,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
