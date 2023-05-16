import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:todo_getx/models/todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;
  StreamSubscription<String>? _textStreamSubscription;
  StreamSubscription<List<SharedMediaFile>>? _mediaStreamSubscription;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {// listen to changes in the todos list
      GetStorage().write('todo', todos.toList());
    });
    Todo todo =Todo (text:"Hello", done:false);
    _textStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String mytext) {
          Todo todo =Todo (text:mytext, done:false);
          todos.add(todo);
        });
    super.onInit();
  }

  Future<List<Object>> loadListFromStorage() async {
    final file = File(
        '${(await getApplicationDocumentsDirectory()).path}/shared_text_list.txt');

    if (await file.exists()) {
      final contents = await file.readAsString();
      return contents.split('\n');
    }

    return [];
  }
}

/*
It imports the necessary packages: get for the GetX library and get_storage for local storage management.
It imports the Todo model, which is assumed to be defined in another file.
It defines the TodoController class that extends GetxController. GetxController is a base class provided by GetX for state management.
It declares an observable list of Todo objects using List<Todo>.empty().obs. The .obs extension converts the list into an RxList, which is an observable list that notifies its observers when it changes.
The onInit method is overridden to initialize the controller.
Inside the onInit method, it attempts to read a list of stored todos from local storage using GetStorage().read<List>('todo'). The read method from GetStorage reads data from storage, and here it tries to read a list of todos with the key 'todo'.
If the storedTodos variable is not null (meaning todos were found in storage), it maps each stored todo to a Todo object using Todo.fromJson(e) and converts the resulting iterable to a list using toList(). Finally, it assigns the converted list to the todos observable list.
The ever method from GetX is used to listen to changes in the todos list. Whenever the todos list changes, the provided callback function will be executed. In this case, the callback function writes the updated todos list to storage using GetStorage().write('todo', todos.toList()).
The super.onInit() method is called to ensure that the overridden onInit method in the base class is also executed.
This code sets up the TodoController class with a list of todos that can be observed and automatically stored in local storage whenever it changes.
 */
