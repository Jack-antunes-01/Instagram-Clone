import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'box_story.dart';
import 'custom_text.dart';

class FindPeople extends StatefulWidget {
  final String name;
  final String img;

  const FindPeople({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  @override
  State<FindPeople> createState() => _FindPeopleState();
}

class _FindPeopleState extends State<FindPeople> {
  bool following = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: white.withOpacity(0.7),
              width: 0.5,
            ),
          ),
          color: black,
          child: SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  BoxStory(
                    image: widget.img,
                    boxSize: 90,
                  ),
                  CustomText(
                    text: widget.name,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const CustomText(
                    text: "Seguir",
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 25,
                    width: 110,
                    decoration: BoxDecoration(
                      color: following ? Colors.white : Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            following = !following;
                          });
                        },
                        child: Center(
                          child: CustomText(
                            text: following ? "Seguindo" : "Seguir",
                            color: following ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 7,
          right: 6,
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.cancel,
                  color: white,
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   child:
        //   top: 7,
        //   right: 6,
        // ),
      ],
    );
  }
}
