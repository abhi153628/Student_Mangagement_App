import 'package:hive_flutter/hive_flutter.dart';
part 'student_modal.g.dart';


@HiveType(typeId: 1)
class StudenytModal extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String courceName;
  @HiveField(3)
  String admissionNo;
  @HiveField(4)
  String email;
  StudenytModal({required this.name,required this.age,required this.admissionNo,required this.courceName,required this.email});
}





