import 'package:flutter/material.dart';
import 'package:instagram_clone/models/activity_model.dart';

import '../enum/app_state.dart';
import '../repositories/activity_repository.dart';

class ActivityController {
  List<ActivityModel> activities = [];

  final ActivityRepository _activityRepository = ActivityRepository();

  final state = ValueNotifier<AppState>(AppState.start);

  Future start() async {
    state.value = AppState.loading;
    try {
      activities = await _activityRepository.fetchActivities();
      state.value = AppState.success;
    } catch (e) {
      state.value = AppState.error;
    }
  }
}
