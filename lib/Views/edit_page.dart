import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/Views/home_page.dart';
import 'package:studenthub/controllers/helper/custom_text.dart';
import 'package:studenthub/controllers/helper/custom_textform_field.dart';
import 'package:studenthub/modals/student_modal.dart';
import 'package:studenthub/provider/provider.dart';

class EditPage extends StatelessWidget {
  final StudenytModal student;
   EditPage({super.key, required this.student});
      final GlobalKey<FormState>formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {

    final nameController=TextEditingController(text: student.name);
    final ageController=TextEditingController(text: student.age);
    final courceController =TextEditingController(text:student.courceName);
    final admissionNUmber=TextEditingController(text: student.admissionNo);
    final mailController = TextEditingController(text: student.email);
  
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 49, 49),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              child: Container(
                color:  Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Create",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      color: Colors.black,
                    ),
                    CustomText(
                      text: "Student Profile",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomFormField(
                 
                  controller: nameController,
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please type a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                
                  controller: ageController,
                  hintText: 'Age',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                
                  controller: courceController,
                  hintText: 'Course Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please give your Course Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
         
                  controller: admissionNUmber,
                  hintText: 'Admission No',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Admission No';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
              
                  controller: mailController,
                  hintText: 'Email Id',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please give your Email Id';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Container(
                  height: 40,
                  width: 600,
                  color: const Color.fromARGB(0, 255, 255, 255),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // Button background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Circular radius
                      ),
                    ),
                    onPressed: () async {
                      await editStudent(context,nameController.text.trim(),ageController.text.trim(),admissionNUmber.text.trim(),courceController.text.trim(),mailController.text.trim());
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  editStudent(BuildContext context,String name,String age,String admissionNo,String email,String courceName)async{
    if(formKey.currentState!.validate()){
      student.name=name;
      student.age=age;
      student.courceName=courceName;
      student.email=email;
      student.admissionNo=admissionNo;
      Provider.of<StudentProvider>(context, listen: false).updateStudent(student);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      
    }

  }
}