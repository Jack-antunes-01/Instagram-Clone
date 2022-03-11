class PostModel {
  int? id;
  late String name;
  late String profileImg;
  late String postImg;
  late String caption;
  late bool isLoved;
  late String commentCount;
  late String likedBy;
  late String timeAgo;

  PostModel({
    this.id,
    required this.name,
    required this.profileImg,
    required this.postImg,
    required this.caption,
    required this.isLoved,
    required this.commentCount,
    required this.likedBy,
    required this.timeAgo,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImg = json['profileImg'];
    postImg = json['postImg'];
    caption = json['caption'];
    isLoved = json['isLoved'];
    commentCount = json['commentCount'];
    likedBy = json['likedBy'];
    timeAgo = json['timeAgo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profileImg'] = profileImg;
    data['postImg'] = postImg;
    data['caption'] = caption;
    data['isLoved'] = isLoved;
    data['commentCount'] = commentCount;
    data['likedBy'] = likedBy;
    data['timeAgo'] = timeAgo;
    return data;
  }
}
