
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:test_camera_follow_in_flame/box2d_components/rive_player_component.dart';
import 'package:test_camera_follow_in_flame/utils/controller.dart';
import 'package:test_camera_follow_in_flame/utils/player_movements.dart';

class PlayerComponent extends BodyComponent with KeyboardHandler{
  final Vector2 position;
  final Vector2 size;

  bool canUp=true;

  final String artboardName;

PlayerComponent({
  required this.position,
  required this.artboardName,
  Vector2? size,
}) : size = size ?? Vector2(8, 12);

  final Controller c = Get.find();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final skillsArtboard = await loadArtboard(RiveFile.asset('assets/images/player.riv'),artboardName: artboardName);

    renderBody = false;
    c.riveAnimationComponent= RiveAnimationComponent(
        skillsArtboard,
        size
    );
    add(c.riveAnimationComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;

    final isArrowUp = keysPressed.contains(LogicalKeyboardKey.arrowUp);
    final isArrowDown = keysPressed.contains(LogicalKeyboardKey.arrowDown);
    final isArrowLeft = keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isArrowRight = keysPressed.contains(LogicalKeyboardKey.arrowRight);

    if (isArrowUp && isKeyDown) {
      PlayerMovements.upImpulse(this);
    }

    if(isArrowLeft){
      PlayerMovements.leftImpulse(this);
      c.riveAnimationComponent.running?.value=true;
    }

    if(isArrowRight){
      PlayerMovements.rightImpulse(this);
      c.riveAnimationComponent.running?.value=true;
    }

    if(isArrowDown && isKeyDown){

    }

    if(!isArrowUp && !isArrowDown && !isArrowLeft && !isArrowRight && !isKeyDown){
      body.linearVelocity.x=0;
      c.riveAnimationComponent.running?.value=false;
      return super.onKeyEvent(event, keysPressed);
    }else{
      return false;
    }
  }

  @override
  Body createBody() {
    final shapeUp = PolygonShape();
    final shapeDown = PolygonShape();

    shapeUp.setAsBox(size.x/2, size.y/2.5,Vector2(0,-4),0);
    shapeDown.setAsBox(size.x/2, size.y/2.5,Vector2(0,6),0);


    final fixtureDef = FixtureDef(shapeUp)
      ..restitution = 0
      ..density = 0.1
      ..friction = 0;

    final fixtureDef2 = FixtureDef(shapeDown)
      ..restitution = 0
      ..density = 0.1
      ..friction = 0;

    final bodyDef = BodyDef()
      ..userData = this // To be able to determine object in collision
      ..position = position
      ..fixedRotation=true
      ..type = BodyType.dynamic;

    body=world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..createFixture(fixtureDef2);

    return body;
  }

}