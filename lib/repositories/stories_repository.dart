import 'package:instagram_clone/constants/story_json.dart';
import 'package:instagram_clone/models/story_model.dart';

class StoriesRepository {
  Future<List<StoryModel>> fetchStories() async {
    List<StoryModel> listStories = [];

    await Future.delayed(const Duration(seconds: 1), () {
      listStories = stories.map((json) => StoryModel.fromJson(json)).toList();
    });

    return listStories;
  }
}
