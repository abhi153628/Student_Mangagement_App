import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/Views/add_student.dart';

import 'package:studenthub/Views/home_page.dart';

import 'package:studenthub/modals/student_modal.dart';
import 'package:studenthub/provider/imageProvider.dart';
import 'package:studenthub/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initilaise hive and open box
  await Hive.initFlutter();
  Hive.registerAdapter(StudenytModalAdapter());
  await Hive.openBox<StudenytModal>('StudentBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider()
        ), ChangeNotifierProvider(create: (context) => Imageprovider()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                      seedColor: const Color.fromARGB(255, 255, 255, 255))
                  .copyWith(
                      background: const Color.fromARGB(255, 255, 255, 255))),
          home:  AddStudentScreen()),
    );
  }
}
