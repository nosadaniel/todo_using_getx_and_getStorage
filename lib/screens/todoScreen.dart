import 'package:counter_app_getx/modules/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:counter_app_getx/controllers/todoController.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();

  TodoScreen();
  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    String text = '';
    if (index != null) {
      text = todoController.todos[index].text;
    }
    print(' index is $index and Text: is $text');
    todoController.textEditingController.text = text;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: todoController.textEditingController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'What do want to accomplish?',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLength: 999,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (index == null) {
                        todoController.addTodo(text);
                      } else {
                        todoController.edit(index);
                      }

                      Get.back();
                    },
                    child: Text((index == null) ? 'Add' : 'Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
