import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:studenthub/modals/student_modal.dart';

class StudentProvider extends ChangeNotifier {
  final Box<StudenytModal> studentBox = Hive.box('StudentBox');
  List<StudenytModal> get students => studentBox.values.toList();

  void addStudent(StudenytModal student) {
    studentBox.add(student);
    notifyListeners();
  }

  void deletStudent(StudenytModal student) {
    int index = studentBox.values.toList().indexOf(student);
    studentBox.delete(index);
    notifyListeners();
  }

  void updateStudent(StudenytModal student) {
    int index = studentBox.values.toList().indexOf(student);
    studentBox.putAt(index, student);
    notifyListeners();
  }
}
