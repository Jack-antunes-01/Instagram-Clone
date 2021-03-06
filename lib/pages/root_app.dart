import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/pages/activity_page.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/profile_page.dart';
import 'package:instagram_clone/pages/search_page.dart';
import 'package:instagram_clone/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      backgroundColor: black,
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List pages = [
      const HomePage(),
      const SearchPage(),
      const Center(
        child: Text(
          "Upload Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      const ActivityPage(),
      const ProfilePage(),
    ];

    return IndexedStack(
      index: pageIndex,
      children: List.generate(pages.length, (index) {
        return pages[index];
      }),
    );
  }

  PreferredSizeWidget? getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 30,
            ),
            const Text(
              "Instagram",
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 35,
              ),
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 30,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Upload"),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: const Text("Activity"),
      );
    } else if (pageIndex == 4) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(children: [
          const Text("Jack_Antunes_01"),
          const SizedBox(width: 10),
          SvgPicture.asset(
            "assets/images/down_arrow.svg",
            width: 10,
            color: white,
          ),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 16,
              bottom: 16,
            ),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/images/add.svg",
                width: 25,
                color: white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 16,
              bottom: 16,
            ),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/images/menu.svg",
                width: 25,
                color: white,
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
      );
    } else {
      return AppBar();
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(color: appFooterColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(bottomItems.length, (index) {
          return InkWell(
            onTap: () {
              selectedTab(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 20),
              child: Ink(
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
