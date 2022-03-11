import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/search_json.dart';
import 'package:instagram_clone/theme/colors.dart';

import '../widgets/search_category.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  width: size.width - 30,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                    style: TextStyle(
                      color: white.withOpacity(0.9),
                    ),
                    cursorColor: white.withOpacity(0.3),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: Row(
                children: List.generate(searchCategories.length, (index) {
                  return CategoryStory(
                    name: searchCategories[index],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(searchImages.length, (index) {
              return Container(
                width: (size.width - 3) / 3,
                height: (size.width - 3) / 3,
                // child: Ink.image(
                //   image: NetworkImage(searchImages[index]),
                //   fit: BoxFit.cover,
                //   // child: InkWell(onTap: () {}),
                // ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(searchImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
