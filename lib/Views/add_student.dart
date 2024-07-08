import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studenthub/Views/home_page.dart';
import 'package:studenthub/controllers/helper/custom_text.dart';
import 'package:studenthub/controllers/helper/custom_textform_field.dart';
import 'package:studenthub/modals/student_modal.dart';
import 'package:studenthub/provider/imageProvider.dart';
import 'package:studenthub/provider/provider.dart';


class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});
    String? imagePath;


  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final courseController = TextEditingController();
  final mailController = TextEditingController();
  final admissionNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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
                color: const Color.fromARGB(255, 255, 255, 255),
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
                  leading: IconButton(onPressed: (){ Provider.of<Imageprovider>(context, listen: false)
                  .setImagePath(null);
              // ignore: prefer_const_constructors
              Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back))
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
                Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Consumer<Imageprovider>(
                            builder: (context, imageprovider, _) {
                          return imageprovider.imagePath != null
                              ? ClipOval(
                                  child: Image.file(
                                  File(imageprovider.imagePath!),
                                  fit: BoxFit.cover,
                                ))
                              : const Icon(
                                  Icons.add_photo_alternate,
                                  size: 60,
                                  color: Colors.white,
                                );
                        })),
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
                
                  controller: courseController,
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
         
                  controller: admissionNumberController,
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
                      await addStudent(context);
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

  addStudent(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final student = StudenytModal(
        name: nameController.text,
        age: ageController.text,
        email: mailController.text,
        admissionNo: admissionNumberController.text, courceName: courseController.text,
        
      );
      Provider.of<StudentProvider>(context, listen: false).addStudent(student);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
   Future<void> pickImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Provider.of<Imageprovider>(context, listen: false)
          .setImagePath(pickedFile.path);
    }
  }
}

