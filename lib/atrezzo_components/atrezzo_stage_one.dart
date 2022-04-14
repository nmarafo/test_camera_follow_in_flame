
import 'package:flame/components.dart';
import 'package:test_camera_follow_in_flame/box2d_components/drawings_component.dart';

class AtrezzoStageOne extends Component{
  late final List<DrawingsComponent> drawings=[];

  @override
  Future<void>? onLoad() async{

    final drawing_1=DrawingsComponent(Vector2(220,-40),'building.png',0,size: Vector2(150,150));
    final drawing_2=DrawingsComponent(Vector2(420,-40),'building.png',0,size: Vector2(150,150));

    drawings.addAll([drawing_1,drawing_2]);

    await addAll(drawings);
  }
}