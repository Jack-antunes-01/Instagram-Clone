import 'package:flutter/material.dart';

import '../theme/colors.dart';

class BoxStory extends StatefulWidget {
  final double? boxSize;
  final String image;
  final bool? hasStory;

  const BoxStory({
    Key? key,
    this.boxSize,
    required this.image,
    this.hasStory,
  }) : super(key: key);

  @override
  State<BoxStory> createState() => _BoxStoryState();
}

class _BoxStoryState extends State<BoxStory> {
  double padding = 3;

  getSize({bool? paddingEnabled}) {
    double size = widget.boxSize ?? 68;
    if (paddingEnabled == true) {
      size = size - padding;
    }
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(),
      height: getSize(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: widget.hasStory == true
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: storyBorderColor,
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          width: getSize(paddingEnabled: true),
          height: getSize(paddingEnabled: true),
          decoration: BoxDecoration(
            border: Border.all(
              color: black,
              width: 2,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
