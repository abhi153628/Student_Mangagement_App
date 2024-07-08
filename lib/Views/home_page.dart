import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/Views/add_student.dart';
import 'package:studenthub/Views/edit_page.dart';
import 'package:studenthub/controllers/helper/custom_text.dart';
import 'package:studenthub/provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentProvider>(context);
    final studentProvider = Provider.of<StudentProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              child: Container(
                color: const Color.fromARGB(255, 46, 49, 49),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: AppBar(
                backgroundColor: const Color.fromARGB(255, 46, 49, 49),
                elevation: 0.0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Student Profile',
                      color: const Color.fromARGB(255, 255, 255, 255),
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: provider.students.isEmpty
          ? const Center(
              child: Text("No students available."),
            )
          : ListView.builder(
              itemCount: studentProvider.students.length,
              itemBuilder: (context, index) {
                final student = provider.students[index];
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      width: 400,
                      decoration: const BoxDecoration(
                        color: const Color.fromARGB(255, 46, 49, 49),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: ListTile(
                        subtitle: Column(
                          children: [
                            Text(
                              'Name: ${student.name}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Age: ${student.age}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            Text('Cource Name: ${student.courceName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text('Email: ${student.email}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                    )),
                            Text('Admission No: ${student.admissionNo}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                const Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditPage(student: student)));
                                    },
                                    child: const Text('Edit')),
                                const Spacer(),
                                ElevatedButton(
                                    onPressed: () { showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Delete'),
                                        content: const Text(
                                            'Are you sure you want to delete this student?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel')),
                                          TextButton(
                                              onPressed: () {
                                           
                                                studentProvider
                                                    .deletStudent(student);
                                                         print('deleted');
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Delete'))
                                        ],
                                      );
                                    },
                                  );}, child: const Text('Delete')),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                   
                  ],
                );
              },
            ), bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Add Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'College',
          ),
        ],
   
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddStudentScreen()));
          
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
        elevation: 7.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
