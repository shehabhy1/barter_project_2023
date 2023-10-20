import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:barter_project_2023/features/add%20post/presentation/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const CustomDropList());

class CustomDropList extends StatefulWidget {
  const CustomDropList({super.key});

  @override
  _CustomDropListState createState() => _CustomDropListState();
}

class _CustomDropListState extends State<CustomDropList> {
  String? _selectedCategory;
  String? _selectedSubcategory;

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

  TextEditingController itemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
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
            defaultTextField(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              type: TextInputType.text,
              controller: itemNameController,
              hint: 'Enter Your Item Name',
              // border: InputBorder.none,

              validate: (val) {
                if (val.isEmpty) {
                  return 'this field is required';
                }
                return null;
              },
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
                  setState(
                    () {
                      _selectedCategory = newValue;
                      _selectedSubcategory = null;
                    },
                  );
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 4,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Price differnce',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_box_outline_blank,
                    size: 41,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 4,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'The application is not responsible for the price difference',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
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
            SizedBox(
              height: context.deviceHeight * 0.2,
              // width: 360,
              child: defaultTextField(
                maxLines: 10,

                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                type: TextInputType.text,
                controller: descriptionController,
                hint: 'Enter a description for the item you want',
                // border: InputBorder.none,

                validate: (val) {
                  if (val.isEmpty) {
                    return 'this field is required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
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
            ),
            Column(
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width * 25,
                  height: MediaQuery.of(context).size.height * .052,
                  color: Constant.primaryColor,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        PostCubit.get(context).uploadFile(
                          name: itemNameController.text,
                          category: _selectedCategory!,
                          subCategory: _selectedSubcategory!,
                          disc: descriptionController.text,
                        );

                        itemNameController.clear();
                        descriptionController.clear();
                      }
                    },
                    child: const Text(
                      'Publish',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
