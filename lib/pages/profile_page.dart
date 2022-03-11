import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/story_json.dart';
import 'package:instagram_clone/widgets/box_story.dart';
import 'package:instagram_clone/widgets/custom_text.dart';

import '../constants/search_json.dart';
import '../theme/colors.dart';
import '../widgets/find_people.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoxStory(
                      image: profile,
                      boxSize: 95,
                    ),
                    Column(
                      children: const [
                        CustomText(
                          text: "3",
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(text: "Publicações"),
                      ],
                    ),
                    Column(
                      children: const [
                        CustomText(
                          text: "84",
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(text: "Seguidores"),
                      ],
                    ),
                    Column(
                      children: const [
                        CustomText(
                          text: "100",
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(text: "Seguindo"),
                      ],
                    ),
                  ],
                ),
                const CustomText(text: "Jack Antunes"),
                const CustomText(
                  text: "@itsmavih ❤️",
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: const Center(
                              child: CustomText(
                                text: "Editar perfil",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.person_add,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      text: "Encontrar pessoas",
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Ver tudo",
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                children: List.generate(stories.length, (index) {
                  return FindPeople(
                    img: stories[index]['img'],
                    name: stories[index]['name'],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  highlightColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: index == 0 ? white : black),
                      ),
                    ),
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        Icon(
                          Icons.grid_on,
                          color: white,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  highlightColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 0.5, color: index == 1 ? white : black),
                      ),
                    ),
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        Icon(
                          Icons.person_pin_outlined,
                          color: white,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          getContent(),
        ],
      ),
    );
  }

  getContent() {
    var size = MediaQuery.of(context).size;
    if (index == 0) {
      return Column(
        children: [
          const SizedBox(height: 4),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(9, (index) {
              return Container(
                width: (size.width - 3) / 3,
                height: (size.width - 3) / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(searchImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 4),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(3, (index) {
              return Container(
                width: (size.width - 3) / 3,
                height: (size.width - 3) / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(searchImages[index + 9]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      );
    }
  }
}
