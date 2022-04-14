
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/atrezzo_components/atrezzo_stage_one.dart';
import 'package:test_camera_follow_in_flame/box2d_components/ground.dart';
import 'package:test_camera_follow_in_flame/box2d_components/parallax_component.dart';
import 'package:test_camera_follow_in_flame/box2d_components/player_component.dart';
import 'package:test_camera_follow_in_flame/utils/controller.dart';

class StageOne extends Forge2DGame with HasTappables,HasDraggables,HasKeyboardHandlerComponents {
  StageOne():super(gravity: Vector2(0, 40));

  final Controller c = Get.find();
  late ParallaxComponent parallaxComponent;
  late PlayerComponent player;

  @override
  Future<void>? onLoad() async{

    camera.viewport = FixedResolutionViewport(camera.viewport.effectiveSize);

    parallaxComponent= MyParallaxComponentOne();

    player=PlayerComponent(position: Vector2(150,-50), artboardName: 'main');
    
    await add(parallaxComponent);

    await add(AtrezzoStageOne());

    await add(player)?.then((value) {
      camera.followBodyComponent(player,
        worldBounds: const Rect.fromLTWH(-500, -1000, 2*500, 2*500)
      );
    });

    await add(Ground(Vector2(0,0),size: Vector2(500,1)));

    addContactCallback(PlayerGroundContactCallback());

    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallaxComponent.parallax?.baseVelocity=Vector2(
        player.body.linearVelocity.x,
        player.body.position.y<-50? -player.body.linearVelocity.y:0);
    super.update(dt);
  }
}