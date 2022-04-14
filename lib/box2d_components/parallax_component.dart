

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class MyParallaxComponentOne extends ParallaxComponent {

  @override
  Future<void>? onLoad() async{
    final List<Future<ParallaxLayer>> layers = [
      gameRef.loadParallaxLayer(
          ParallaxImageData('parallax/1_1.png'),
          velocityMultiplier: Vector2(1.5, -0.5),
          fill: LayerFill.height
      ),
      gameRef.loadParallaxLayer(
          ParallaxImageData('parallax/1_3.png'),
          velocityMultiplier: Vector2(3.0, -0.5),
          fill: LayerFill.height
      ),
    ];

    positionType=PositionType.viewport;
    //scale.scale(1.5);
    parallax = Parallax(
        await Future.wait(layers),
    baseVelocity: Vector2.zero(),
    );
    return super.onLoad();
  }
}