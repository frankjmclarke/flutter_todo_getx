import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/models/todo.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                // ignore: deprecated_member_use
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    todoController.todos.add(
                      Todo(
                        text: textEditingController.text,
                      ),
                    );
                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
/*
The code provided is an example of a Flutter widget called TodoScreen. This widget represents a screen where users can add new todos. Here's an explanation of the code:

It imports the necessary packages, including flutter/material.dart for Flutter widgets, flutter/services.dart for system services, get for the GetX library, and the Todo model and TodoController class.
The TodoScreen class extends StatelessWidget, indicating that it doesn't maintain any internal state.
It defines a static id property that can be used to identify the screen's route.
An instance of TodoController is created using Get.find<TodoController>(). This retrieves an instance of TodoController from the GetX dependency injection system.
A TextEditingController is declared to control the text entered in the TextField.
The TodoScreen constructor is defined, with an optional Key parameter. The constructor also calls the super constructor from the base class (StatelessWidget).
The build method is overridden to create the widget's UI.
The Scaffold widget is used as the main container for the screen.
Inside the Scaffold, a Container is used to provide padding for its child widgets.
The main content of the screen is a Column widget containing two main children widgets.
The first child is an Expanded widget wrapping a TextField. The Expanded widget allows the TextField to take up the remaining vertical space.
The TextField widget represents the input field where the user can enter the text for a new todo.
The TextField has various properties set, such as decoration for the input field's visual styling, style for the text style, keyboardType for the input type, maxLines for the number of lines to display, and controller to control the text entered.
The second child of the Column is a Row widget containing two TextButton widgets.
The first TextButton widget represents the "Cancel" button. When pressed, it navigates back to the previous screen using Get.back().
The second TextButton widget represents the "Add" button. When pressed, it creates a new Todo object with the text entered in the TextField and adds it to the todos list in the TodoController. Afterward, it navigates back to the previous screen using Get.back().
This code sets up the UI for the TodoScreen widget, allowing users to enter new todos and add them to the list managed by the TodoController using the GetX library.
 */
