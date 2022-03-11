import 'package:flutter/material.dart';
import 'box_story.dart';

class ActivityItem extends StatelessWidget {
  final bool? hasStory;
  final String text;
  final String timeAgo;
  final String image;
  final String? mentionedImage;
  final bool? following;

  final VoidCallback? callback;

  const ActivityItem({
    Key? key,
    this.hasStory,
    required this.text,
    required this.timeAgo,
    required this.image,
    this.mentionedImage,
    this.following,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxStory(
            image: image,
            boxSize: 50,
            hasStory: hasStory,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '$text '),
                  TextSpan(text: timeAgo),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          renderButtonImageOrNull(),
        ],
      ),
    );
  }

  renderButtonImageOrNull() {
    if (mentionedImage != null) {
      return Container(
        width: 47,
        height: 47,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(mentionedImage!),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    if (following == false) {
      return SizedBox(
        height: 28,
        child: ElevatedButton(
          onPressed: () {
            callback!();
          },
          child: const Text(
            "Seguir",
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
