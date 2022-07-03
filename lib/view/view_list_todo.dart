import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/getx/todo_controller.dart';

// ignore: must_be_immutable
class ToDoListScreen extends StatelessWidget {
  ToDoListScreen({Key? key}) : super(key: key);

  TodoController todoList =
      Get.put(TodoController()); // instantiating your controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO LIST'),
        centerTitle: true,
        backgroundColor:
            Get.theme.primaryColor, // get color of theme in Getmaterial
      ),
      body: Container(
          color: Colors.white,
          child: Obx(
            () => ListView.builder(
              itemCount: todoList.taskInComplete.length, // length of todo list
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  var respon = await Get.to(() => {},
                      arguments: todoList.taskInComplete[index]);

                  if (respon == 'editSuccess') {}
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Checkbox(
                          value: todoList.taskInComplete[index].isDone,
                          onChanged: (_) {
                            Get.snackbar(
                                "Change Status",
                                todoList.toggleToDoStatus(
                                        todoList.taskInComplete[index])
                                    ? 'Completed'
                                    : '',
                                icon:
                                    const Icon(Icons.check, color: Colors.blue),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.white);
                          }),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todoList.taskInComplete[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child:
                                Text(todoList.taskInComplete[index].description,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              todoList.taskInComplete[index].createdTime
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )),
                      TextButton(
                          onPressed: () {
                            todoList.deleteTaskUseObx(
                                todoList.taskInComplete[index]);
                            Get.snackbar('Delete task', 'success');
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )),

      floatingActionButton: FloatingActionButton(
        // add task icon
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      // GetBuilder<ToDoController>(
      //   builder: (controller) => ListView.builder(
      //     itemCount: todoList.taskInComplete.length, // length of todo list
      //     itemBuilder: (context, index) => GestureDetector(
      //       child: Padding(
      //         padding: const EdgeInsets.all(16),
      //         child: Row(
      //           children: [
      //             Checkbox(
      //                 value: todoList.getToDoList[index].isDone,
      //                 onChanged: (condition) {}),
      //             const SizedBox(width: 20),
      //             Expanded(
      //                 child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   todoList.getToDoList[index].task,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20,
      //                       color: Theme.of(context).primaryColor),
      //                 ),
      //                 Text(todoList.getToDoList[index].description,
      //                     style: const TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18,
      //                     )),
      //                 Text(
      //                   todoList.getToDoList[index].createDay,
      //                   style: const TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 16,
      //                   ),
      //                 ),
      //               ],
      //             )),
      //             TextButton(
      //                 onPressed: () {
      //                   todoList.deleteTask(todoList.getToDoList[index]);
      //                 },
      //                 child: const Icon(Icons.delete))
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // )),
    );
  }
}
