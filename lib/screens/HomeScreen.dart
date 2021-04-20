import 'package:flutter/material.dart';
import 'package:counter_app_getx/controllers/todoController.dart';
import 'package:get/get.dart';
import 'package:counter_app_getx/screens/todoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo APP'),
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    onDismissed: (_) {
                      var removed = todoController.todos[index];
                      todoController.todos.removeAt(index);
                      Get.snackbar(
                        'Task Removed',
                        'The task ${removed.text} was successfully removed.',
                        colorText: Colors.white,
                        backgroundColor: Colors.green,
                        showProgressIndicator: true,
                        mainButton: TextButton(
                          onPressed: () {
                            if (removed == null) {
                              return;
                            }
                            todoController.todos.insert(index, removed);
                            if (Get.isSnackbarOpen) {
                              Get.back();
                            }
                          },
                          child: Text(
                            'Undo',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      onTap: () => Get.to(TodoScreen(), arguments: index),
                      title: Text(
                        '${todoController.todos[index].text}',
                        style: (todoController.todos[index].done)
                            ? TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                              )
                            : TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                              ),
                      ),
                      leading: Checkbox(
                        value: todoController.todos[index].done,
                        onChanged: (value) {
                          var changed = todoController.todos[index];
                          changed.done = value;
                          todoController.todos[index] = changed;
                        },
                      ),
                      trailing: Icon(Icons.chevron_right_outlined),
                    ),
                  ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoController.todos.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
    );
  }
}
