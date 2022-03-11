import 'dart:math';

import 'package:instagram_clone/constants/activity_json.dart';
import 'package:instagram_clone/models/activity_model.dart';

class ActivityRepository {
  Future<List<ActivityModel>> fetchActivities() async {
    List<ActivityModel> activitiesList = [];

    await Future.delayed(const Duration(seconds: 2), () {
      final Random random = Random();
      int value = random.nextInt(100);
      if (value > 60) {
        activitiesList =
            activities.map((json) => ActivityModel.fromJson(json)).toList();
      }
    });

    return activitiesList;
  }
}
