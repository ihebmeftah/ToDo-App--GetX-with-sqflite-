import 'package:get/get.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  Future<int> addTasks({Task? task}) {
    return DBHelper.insert(task);
  }

Future  getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }

 void deleteTasks(Task task) async {
    await DBHelper.delete(task);
    getTasks();
  }

  void markuscompleted(int id) async {
    await DBHelper.updateraw(id);
    getTasks();
  }
}
