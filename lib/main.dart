import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/pages/introPage.dart';
import 'package:test_camera_follow_in_flame/pages/main_game_page.dart';
import 'package:test_camera_follow_in_flame/utils/controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetMaterialApp(
      title: 'Test followComponent()',
      initialRoute: '/',
      routes: {
        '/': (context) => IntroPage(),
        '/main_game_page': (context) => MainGamePage(),
      },
    );
  }
}

