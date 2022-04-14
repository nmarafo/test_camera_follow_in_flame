
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/utils/controller.dart';

class ScreenButtons extends StatelessWidget {

  final Controller c = Get.find();

  ScreenButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                child: const Icon(Icons.home),
                onPressed: (){
                  //Intro Page
                },
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                child: const Icon(Icons.fullscreen),
                onPressed: (){
                  //Fullscreen with PC
                  /*if(c.isFullscreen){
                    c.isFullscreen=false;
                    document.exitFullscreen();
                  }else{
                    c.isFullscreen=true;
                    document.documentElement?.requestFullscreen();
                  }*/
                },
              ),
            )
          ],
        ),
        Expanded(child: Container())
      ],
    );
  }
}
