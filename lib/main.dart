import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:todo_getx/ui/auth_screen.dart';
import 'package:todo_getx/ui/home_screen.dart';
import 'package:todo_getx/ui/todo_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Flutter Todo Getx';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: AuthPage.id,
      getPages: [
        GetPage(name: TodoScreen.id, page: () => TodoScreen()),
        GetPage(name: HomeScreen.id, page: () => HomeScreen()),
        GetPage(name: AuthPage.id, page: () => const AuthPage()),
      ],
    );
  }
}
