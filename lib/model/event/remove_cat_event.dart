import 'package:demo_front/model/cat.dart';
import 'package:demo_front/model/event/base_event.dart';

class RemoveCatEvent implements BaseEvent {
  final List<Cat> removedCats;

  RemoveCatEvent({required this.removedCats});
}
