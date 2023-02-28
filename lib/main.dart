import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/getx_controller.dart';
import 'package:getx_state_management/my_controller.dart';
import 'package:getx_state_management/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountIncrement(),
    );
  }
}

class CountIncrement extends StatelessWidget {
  var student = Student();
  var count = 0.obs;
  GetController getController = Get.put(GetController());
  CountIncrement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('State Management')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetX<MyController>(
                  init: MyController(),
                  builder: (controller) {
                    return Text("The value is ${controller.count}",
                        style: TextStyle(fontSize: 25));
                  },
                ),
                Obx(() => Text("name is ${getController.student.name}",
                    style: const TextStyle(fontSize: 25))),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Get.find<MyController>().increment();
                    },
                    child: const Text('Increment')),
                TextButton(
                    onPressed: () {
                      getController.convertToUppercase();
                    },
                    child: const Text('upper'))
              ]),
        ));
  }
}
