import 'package:flutter/material.dart';

import 'package:instagram_clone/constants/post_json.dart';
import 'package:instagram_clone/constants/story_json.dart';
import 'package:instagram_clone/theme/colors.dart';
import 'package:instagram_clone/widgets/story_item.dart';

import '../widgets/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List storiesList = [
    Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: black,
          width: 2,
        ),
        image: DecorationImage(
          image: NetworkImage(stories[0]['img']),
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 65,
                        height: 65,
                        child: Stack(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(profile),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                  ),
                                  child: const Icon(
                                    Icons.add_circle,
                                    color: buttonFollowColor,
                                    size: 19,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: List.generate(stories.length, (index) {
                    return StoryItem(
                      img: stories[index]['img'],
                      name: stories[index]['name'],
                    );
                  }),
                ),
              ],
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),
          Column(
            children: List.generate(posts.length, (index) {
              return PostItem(
                name: posts[index]['name'],
                profileImg: posts[index]['profileImg'],
                postImg: posts[index]['postImg'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                commentCount: posts[index]['commentCount'],
                likedBy: posts[index]['likedBy'],
                timeAgo: posts[index]['timeAgo'],
              );
            }),
          ),
        ],
      ),
    );
  }
}
