import 'package:flutter/material.dart';

import 'package:instagram_clone/controllers/home_controller.dart';
import 'package:instagram_clone/theme/colors.dart';
import 'package:instagram_clone/widgets/story_item.dart';

import '../enum/app_state.dart';
import '../widgets/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _homeController.start();
  }

  _start() {
    return Container();
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(white),
      ),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _homeController.start();
        },
        child: const Text("Try again"),
      ),
    );
  }

  _success() {
    return getBody();
  }

  stateManagement(AppState state) {
    switch (state) {
      case AppState.start:
        return _start();
      case AppState.loading:
        return _loading();
      case AppState.error:
        return _error();
      case AppState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _homeController.state,
      builder: (context, child) {
        return stateManagement(_homeController.state.value);
      },
    );
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
                                  image:
                                      NetworkImage(_homeController.profileImg),
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
                          _homeController.profileName,
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
                  children:
                      List.generate(_homeController.stories.length, (index) {
                    return StoryItem(
                      img: _homeController.stories[index].img,
                      name: _homeController.stories[index].name,
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
            children: List.generate(_homeController.posts.length, (index) {
              final post = _homeController.posts[index];
              return PostItem(
                callback: () {
                  setState(() {
                    _homeController.posts[index].isLoved =
                        !_homeController.posts[index].isLoved;
                  });
                },
                name: post.name,
                profileImg: post.profileImg,
                postImg: post.postImg,
                caption: post.caption,
                isLoved: post.isLoved,
                commentCount: post.commentCount,
                likedBy: post.likedBy,
                timeAgo: post.timeAgo,
              );
            }),
          ),
        ],
      ),
    );
  }
}
