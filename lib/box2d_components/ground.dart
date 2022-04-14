import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:test_camera_follow_in_flame/box2d_components/player_component.dart';
import 'package:test_camera_follow_in_flame/box2d_components/rive_player_component.dart';

class Ground extends BodyComponent {
  final Vector2 position;
  final Vector2 size;

  Ground(
      this.position,{
        Vector2? size,
      }) : size = size ?? Vector2(2, 3);

  @override
  Body createBody() {
    final shape = PolygonShape();

    shape.setAsBoxXY(size.x, size.y);

    final fixtureDef = FixtureDef(shape)
      ..restitution = 0
      ..density=1.0
      ..friction = 0;

    final bodyDef = BodyDef()
      ..userData = this // To be able to determine object in collision
      ..position=position
      ..type = BodyType.static;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}

class PlayerGroundContactCallback extends ContactCallback<PlayerComponent, Ground> {

  @override
  void begin(PlayerComponent a, Ground b, Contact contact) {
    a.canUp=true;
  }

  @override
  void end(PlayerComponent a, Ground b, Contact contact) {
    a.canUp=false;
  }
}
