
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/stages/stage_one.dart';

import '../utils/screen_buttons.dart';

class MainGamePage extends StatelessWidget {
  MainGamePage({Key? key}) : super(key: key);
  final flameBase = StageOne();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:  GameWidget(
              game: flameBase,
              loadingBuilder: (context) => Center(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 50,),
                      Expanded(child: Container()),
                      const CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('loading'.tr),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tight(const Size(100,100)),
                          child: const Image(
                            image: AssetImage('assets/images/teclado.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
              //Work in progress error handling
              errorBuilder: (context, ex) {
                //Print the error in th dev console
                debugPrint(ex.toString());
                return const Center(
                  child: Text('Sorry, something went wrong. Reload me'),
                );
              },
              overlayBuilderMap: {
                'buttons': (ctx, game) {
                  return ScreenButtons();
                },
              },
              initialActiveOverlays: const ['buttons'],
            )
          ),
        ],
      ),
    );
  }
}
