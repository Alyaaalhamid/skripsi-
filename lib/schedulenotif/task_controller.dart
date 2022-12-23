import 'dart:ffi';

import 'package:get/get.dart';
import 'package:skripsi/schedulenotif/db_helper.dart';
import 'package:skripsi/schedulenotif/task_modul.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await taskHelper.insert(task);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await taskHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    taskHelper.delete(task);
    getTask();
  }

  void markTaskCompleted(int id) async {
    await taskHelper.update(id);
    getTask();
  }
}
