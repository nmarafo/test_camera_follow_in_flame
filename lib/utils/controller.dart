
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/box2d_components/rive_player_component.dart';

class Controller extends GetxController{
  bool isLeftPosition=false;
  bool isRightPosition=true;
  Vector2 horizontalImpulseForce=Vector2(600, 0);
  Vector2 verticalImpulseForce=Vector2(0, -700);
  late final RiveAnimationComponent riveAnimationComponent;

}