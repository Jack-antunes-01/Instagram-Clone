class StoryModel {
  int? id;
  late String img;
  late String name;

  StoryModel({this.id, required this.img, required this.name});

  StoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['name'] = name;
    return data;
  }
}
