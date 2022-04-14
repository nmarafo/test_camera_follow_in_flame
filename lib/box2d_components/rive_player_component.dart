import 'package:flame/components.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

class RiveAnimationComponent extends RiveComponent {
  RiveAnimationComponent(Artboard artboard,Vector2 size)
      : super(
      artboard: artboard,
      size: size*2,
      anchor: Anchor.center
  );

  SMIBool? running;


  @override
  Future<void>? onLoad() {
    final controller = StateMachineController.fromArtboard(artboard, 'state_machine');
    artboard.addController(controller!);
    running = controller.findInput<bool>('running') as SMIBool;
    running?.value=false;

    return super.onLoad();
  }
}