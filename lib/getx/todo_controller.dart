import 'dart:collection';

import 'package:get/get.dart';
import 'package:todo_app_getx/models/todo_model.dart';

class TodoController extends GetxController {
  List<TodoModel> todoListDelete = <TodoModel>[].obs;

  final RxList<TodoModel> _todos = <TodoModel>[
    TodoModel(
        id: DateTime.now.toString(),
        title: "Learning Vocabulary",
        createdTime: DateTime.now(),
        description: "Spending 30 minute to write down new word",
        isDone: false),
    TodoModel(
        id: DateTime.now.toString(),
        title: "Learning Vocabulary",
        createdTime: DateTime.now(),
        description: "Spending 30 minute to write down new word",
        isDone: false),
    TodoModel(
        id: DateTime.now.toString(),
        title: "Learning New Word",
        createdTime: DateTime.now(),
        description: "Spending 30 minute to write down new word",
        isDone: false),
  ].obs;

  /*
    get all data TodoModel 
  */
  UnmodifiableListView<TodoModel> get allTodos => UnmodifiableListView(_todos);
  /*
    get data doesn't complete
  */
  List<TodoModel> get taskInComplete =>
      _todos.where((element) => element.isDone == false).toList();

  /*
    get all data TodoModel completed
  */
  List<TodoModel> get taskCompleted =>
      _todos.where((element) => element.isDone == true).toList();

  List<TodoModel> get getListDelete => todoListDelete;

  void addTodoModel(TodoModel task) {
    _todos.add(task);
  }

  bool toggleToDoStatus(TodoModel task) {
    task.isDone = !task.isDone;
    _todos.refresh();
    return task.isDone;
  }

  void updateTask(TodoModel task) {}

  void deleteTodoModel(TodoModel task) {
    _todos.remove(task);
    todoListDelete.add(task);
    update();
  }

  void deleteTaskUseObx(TodoModel task) {
    todoListDelete.add(task);
    _todos.remove(task);
  }
}
