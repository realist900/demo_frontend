import 'package:demo_front/model/event/base_event.dart';

class RemoveCatEvent implements BaseEvent {
  final List<int> removedCatIds;

  RemoveCatEvent({required this.removedCatIds});
}
