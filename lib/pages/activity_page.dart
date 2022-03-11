import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/activity_json.dart';
import 'package:instagram_clone/controllers/activity_controller.dart';
import 'package:instagram_clone/enum/app_state.dart';
import 'package:instagram_clone/widgets/activity_item.dart';
import 'package:instagram_clone/widgets/custom_text.dart';

import '../theme/colors.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final _activityController = ActivityController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _activityController.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: storyBorderColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: black,
                            shape: BoxShape.circle,
                          ),
                          width: 30,
                          height: 30,
                          child: const Icon(
                            Icons.check,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: "This is all",
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 3),
                    CustomText(
                      text: "See new activity for Jack_Antunes01",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: white.withOpacity(0.5),
              height: 30,
            ),
            const CustomText(
              text: "This week",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
                animation: _activityController.state,
                builder: (context, child) {
                  return stateManagement(_activityController.state.value);
                }),
          ],
        ),
      ),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _activityController.start();
        },
        child: const Text("Try again"),
      ),
    );
  }

  _success() {
    if (_activityController.activities.isNotEmpty) {
      return Column(
        children: List.generate(_activityController.activities.length, (index) {
          final activity = _activityController.activities[index];

          return ActivityItem(
            hasStory: activity.hasStory,
            image: activity.img,
            following: activity.following,
            text: activity.text,
            timeAgo: activity.timeAgo,
            mentionedImage: activity.mentionedImage,
            callback: () {
              setState(() => {activity.following = true});
            },
          );
        }),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(text: "No activities"),
            ElevatedButton(
              onPressed: () {
                _activityController.start();
              },
              child: const Text("Try again"),
            ),
          ],
        ),
      );
    }
  }

  _loading() {
    return const Center(child: CircularProgressIndicator(color: white));
  }

  _start() {
    return const SizedBox.shrink();
  }

  stateManagement(AppState value) {
    switch (value) {
      case AppState.start:
        return _start();
      case AppState.loading:
        return _loading();
      case AppState.success:
        return _success();
      case AppState.error:
        return _error();
      default:
        return _start();
    }
  }
}
