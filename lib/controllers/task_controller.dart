import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/task.dart';

class TaskController extends GetxController {
  List<Task> taskList = [
    Task(id: 0,
      note: '8dwa ma y3adich proba 3la khater hoa bhyyyyym fl proba ',
      title: 'Iheb Meftah ',
      startTime: DateFormat('hh:mm a')
          .format(DateTime.now().add(const Duration(minutes: 1)))
          .toString(),
      isCompleted: 0,
      color: 2,
    ),
  ];
  getTasks() {}
}
