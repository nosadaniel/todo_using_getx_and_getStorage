import 'package:counter_app_getx/modules/todo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    List storedTodos = GetStorage().read('todos');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) => GetStorage().write('todos', todos.toList()));
    super.onInit();
  }

  void edit(int index) {
    var edit = todos[index];
    edit.text = textEditingController.text;
    todos[index] = edit;
  }

  void addTodo(String text) {
    todos.add(Todo(text: textEditingController.text));
  }
}
