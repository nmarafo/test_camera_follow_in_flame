import 'package:get/get.dart';
import 'package:test_camera_follow_in_flame/box2d_components/player_component.dart';
import 'package:test_camera_follow_in_flame/utils/controller.dart';

class PlayerMovements {

  final Controller c = Get.find();
  final PlayerComponent player;

  PlayerMovements.leftImpulse(this.player){
    if(c.isRightPosition){
      c.isRightPosition=false;
      c.isLeftPosition=true;
      c.riveAnimationComponent.flipHorizontallyAroundCenter();
    }
    if(player.body.linearVelocity.x>-35){
      player.body.applyLinearImpulse(-c.horizontalImpulseForce);
    }
  }

  PlayerMovements.rightImpulse(this.player){
    if(c.isLeftPosition){
      c.isRightPosition=true;
      c.isLeftPosition=false;
      c.riveAnimationComponent.flipHorizontallyAroundCenter();
    }
    if(player.body.linearVelocity.x<35){
      player.body.applyLinearImpulse(c.horizontalImpulseForce);
    }
  }

  PlayerMovements.upImpulse(this.player){
    if(player.canUp){
      player.body.applyLinearImpulse(c.verticalImpulseForce);
    }
    player.canUp=false;
  }
}