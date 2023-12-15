import 'dart:io';

import 'package:barter_project_2023/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

void main() => runApp(const CustomDropList());

class CustomDropList extends StatefulWidget {
  const CustomDropList({super.key});

  @override
  _CustomDropListState createState() => _CustomDropListState();
}

class _CustomDropListState extends State<CustomDropList> {
  String? _selectedCategory;
  String? _selectedSubcategory;
  var userproduct = FirebaseFirestore.instance.collection('users');
  TextEditingController itemController = TextEditingController();
  String? categoryController;
  String? subCategoryController;
  TextEditingController descController = TextEditingController();
  File? file;
  String imgUrl = '';
  final Map<String, List<String>> _subcategoryOptions = {
    'Electronics': [
      'Phones& Tablets',
      'Accessories',
      'Mobile numbers',
      'Gaming HDDs',
      'Photography equipment',
    ],
    'Fashion&Cosmetics': [
      'Clothes',
      'blogs & Shoes',
      'Cosmetics & Perfumes',
    ],
    'Pets': [
      'Cats',
      'Dogs',
      'Birds ',
      'Pet supplies or accessories',
    ],
    'Books': [
      'Novels & stories',
      'Books',
      ' Newspappers & magazines',
      'School books',
      'Faculty books',
    ],
    'Home': [
      'Furniture',
      'Electrical devices',
      'Fabrics-curtains-carpets',
      'Decorations & accessories',
    ],
    'Vehicle': [
      'Vehicles',
      'Motorcycles',
      'Spare parts',
    ],
    'Apartment': [
      'Villas',
      'Lands',
    ],
    'Service': [
      'Cooking',
      'Teaching',
      'Driving',
      'Maintenance',
      'House keeping',
      'Photography',
    ],
  };

  final List<String> _categoryOptions = [
    'Electronics',
    'Fashion&Cosmetics',
    'Pets',
    'Books',
    'Home',
    'Vehicle',
    'Apartment',
    'Service',
  ];
  var destination;
  void selectImage() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectImage();
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                    backgroundImage: file != null ? FileImage(file!) : null,
                    child: file == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 60,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Item Name',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TextFormField(
                    controller: itemController,
                    decoration: const InputDecoration(
                      labelText: 'Item Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: DropdownButtonFormField(
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                        _selectedSubcategory = null;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: InputBorder.none,
                    ),
                    items: _categoryOptions.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 4,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Sub Category',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: DropdownButtonFormField(
                    value: _selectedSubcategory,
                    onChanged: (_selectedCategory == null)
                        ? null
                        : (String? newValue) {
                            setState(() {
                              _selectedSubcategory = newValue;
                            });
                          },
                    decoration: const InputDecoration(
                      labelText: 'SubCategory',
                      border: InputBorder.none,
                    ),
                    items: (_selectedCategory == null)
                        ? null
                        : _subcategoryOptions[_selectedCategory]!
                            .map((subcategory) {
                            return DropdownMenuItem(
                              value: subcategory,
                              child: Text(subcategory),
                            );
                          }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TextFormField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                /*  Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 4,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Do you want to exchange a specific product?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ), */
                /*  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.check_circle_outline),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'No',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.check_circle_outline),
                      ],
                    ),
                  ],
                ), */
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 25,
                    height: MediaQuery.of(context).size.height * .052,
                    color: Constant.primaryColor,
                    child: TextButton(
                      onPressed: () async {
                        Reference storageReference = FirebaseStorage.instance
                            .ref()
                            .child('products/$destination');
                        await storageReference.putFile(file!);
                        imgUrl = await storageReference.getDownloadURL();
                        FirebaseFirestore.instance.collection('products').add({
                          'pic': imgUrl,
                          'itemname': itemController.text,
                          'category': _selectedCategory,
                          'subcategory': _selectedSubcategory,
                          'description': descController.text,
                        });
                      },
                      child: const Text(
                        'Publish',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
