import 'package:instagram_clone/constants/post_json.dart';
import 'package:instagram_clone/models/post_model.dart';

class PostsRepository {
  Future<List<PostModel>> fetchPosts() async {
    List<PostModel> listPosts = [];
    await Future.delayed(const Duration(seconds: 2), () {
      listPosts = posts.map((json) => PostModel.fromJson(json)).toList();
    });

    return listPosts;
  }
}
