import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/student.dart';

class GetController extends GetxController {
  var student = Student();

  void convertToUppercase() {
    print(student.name);
    student.name.value = student.name.value.toUpperCase();
  }
}
