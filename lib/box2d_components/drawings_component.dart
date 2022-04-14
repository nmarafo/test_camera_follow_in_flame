import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class DrawingsComponent extends BodyComponent {
  final Vector2 position;
  final Vector2 size;
  final String path;
  @override
  final double angle;

  DrawingsComponent(
      this.position,this.path,this.angle,{
        Vector2? size,
      }) : size = size ?? Vector2(2, 3);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = await gameRef.loadSprite(path);
    renderBody=false;
    add(
        SpriteComponent(
            sprite: sprite,
            size: size,
            anchor: Anchor.center
        ));
  }

  @override
  Body createBody() {
    final shape = PolygonShape();

    shape.setAsBoxXY(size.x/2, size.y/2);

    final bodyDef = BodyDef()
      ..position=position
      ..type = BodyType.static;

    return world.createBody(bodyDef);
  }
}