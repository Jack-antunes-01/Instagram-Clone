class ActivityModel {
  late int? id;
  late bool? hasStory;
  late String img;
  late String text;
  late bool following;
  late String timeAgo;
  late String? mentionedImage;

  ActivityModel({
    this.id,
    this.hasStory,
    required this.img,
    required this.text,
    required this.following,
    required this.timeAgo,
    this.mentionedImage,
  });

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasStory = json['hasStory'];
    img = json['img'];
    text = json['text'];
    following = json['following'];
    timeAgo = json['timeAgo'];
    mentionedImage = json['mentionedImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hasStory'] = hasStory;
    data['img'] = img;
    data['text'] = text;
    data['following'] = following;
    data['timeAgo'] = timeAgo;
    data['mentionedImage'] = mentionedImage;
    return data;
  }
}
