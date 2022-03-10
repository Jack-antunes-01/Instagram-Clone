import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CategoryStory extends StatelessWidget {
  final String name;

  const CategoryStory({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: black,
          border: Border.all(
            color: white.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 25,
            top: 10,
            bottom: 10,
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
