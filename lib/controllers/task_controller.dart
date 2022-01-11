import 'package:get/get.dart';
import 'package:todo/models/task.dart';

class TaskController extends GetxController {
  List<Task> taskList = [
    Task(
      note: '8dwa ma y3adich proba 3la khater hoa bhyyyyym fl proba ',
      title: 'Iheb Meftah ',
      startTime: '20.00',
      endTime: '22.00',
      isCompleted: 0,
      color: 2,
    ),
    Task(
      note: '8dwa ma y3adich proba 3la khater hoa bhyyyyym fl proba ',
      title: 'Iheb Meftah ',
      startTime: '20.00',
      endTime: '22.00',
      isCompleted: 0,
      color: 1,
    ),
    Task(
      note: '8dwa ma y3adich proba 3la khater hoa bhyyyyym fl proba ',
      title: 'Iheb Meftah ',
      startTime: '20.00',
      endTime: '22.00',
      isCompleted: 0,
      color: 0,
    )
  ];
  getTasks() {}
}
