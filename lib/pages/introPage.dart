import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/pages/main_game_page.dart';
import 'package:test_camera_follow_in_flame/utils/controller.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.purple,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(20),
                    child: Text(
                        'Camera Follow Component Test',
                      style: TextStyle(
                        fontFamily: 'Railway',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Color.fromARGB(100, 240, 182, 249),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(100),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(100,100)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Colors.deepPurple,
                                width: 4
                            )
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.to(MainGamePage());
                            },
                            icon: const Icon(Icons.videogame_asset)
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                ],
              )
              ,
            )
          ),
        ],
      ),
    );
  }
}
