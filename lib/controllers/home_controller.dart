import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/story_json.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/models/story_model.dart';
import 'package:instagram_clone/repositories/posts_repository.dart';
import 'package:instagram_clone/repositories/stories_repository.dart';

import '../enum/app_state.dart';

class HomeController {
  List<PostModel> posts = [];
  List<StoryModel> stories = [];
  final String profileImg = profile;
  final String profileName = name;

  final PostsRepository _postsRepository = PostsRepository();
  final StoriesRepository _storiesRepository = StoriesRepository();

  final state = ValueNotifier<AppState>(AppState.start);

  Future start() async {
    state.value = AppState.loading;
    try {
      posts = await _postsRepository.fetchPosts();
      stories = await _storiesRepository.fetchStories();
      state.value = AppState.success;
    } catch (e) {
      state.value = AppState.error;
    }
  }
}
