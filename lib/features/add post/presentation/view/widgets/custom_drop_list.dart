import 'package:barter_app/core/helper/app_constants.dart';
import 'package:barter_app/core/helper/extentions.dart';
import 'package:barter_app/core/helper/spacing.dart';
import 'package:barter_app/core/shared_widget/app_text_field.dart';
import 'package:barter_app/features/add%20post/presentation/view/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// // a7a what is that ????????????????????????????
// //عايزين شويه كاتشب -_-
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

  // String? _selectedCategory;
  // String? _selectedSubcategory;
  String? _selectedSpecCategory;
  String? _selectedSpecSubcategory;

  // Map<String, List<String>>? _subcategoryOptions;
  @override
  // List<String>? _categoryOptions;
  int selection = 0;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController itemNameSpecController = TextEditingController();
  TextEditingController descriptionSpecController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: TextFormField(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: InputBorder.none,
                ),
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
                    Expanded(
                      child: ListTile(
                        title: const Text('yes'),
                        leading: Radio<int>(
                            value: 1,
                            groupValue:
                                selection, //PostCubit.get(context).exchangeSelected,
                            onChanged: (newval) {
                              setState(() {
                                selection = newval!;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('no'),
                        leading: Radio<int>(
                            value: 0,
                            groupValue:
                                selection, //PostCubit.get(context).exchangeSelected,
                            onChanged: (newval) {
                              setState(() {
                                /* PostCubit.get(context).exchangeSelected =
                                    newval!; */
                                selection = newval!;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                selection == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child:
                                  Image.asset('assets/images/logo_icon.png')),
                          verticalSpace(20),
                          const Text(
                            'What are you want?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          verticalSpace(10),
                          Column(
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
                              AppTextFiled(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  type: TextInputType.text,
                                  controller: itemNameSpecController,
                                  hint: 'Enter Your Item Name',
                                  // border: InputBorder.none,

                                  validate: (val) {
                                    if (val == null) {
                                      return 'this field is required';
                                    }
                                    return null;
                                  }),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: DropdownButtonFormField(
                                  value: _selectedSpecCategory,
                                  onChanged: (String? newValue) {
                                    setState(
                                      () {
                                        _selectedSpecCategory = newValue;
                                        _selectedSpecSubcategory = null;
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
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: DropdownButtonFormField(
                              value: _selectedSpecSubcategory,
                              onChanged: (_selectedSpecCategory == null)
                                  ? null
                                  : (String? newValue) {
                                      setState(() {
                                        _selectedSpecSubcategory = newValue;
                                      });
                                    },
                              decoration: const InputDecoration(
                                labelText: 'SubCategory',
                                border: InputBorder.none,
                              ),
                              items: (_selectedSpecCategory == null)
                                  ? null
                                  : _subcategoryOptions![_selectedSpecCategory]!
                                      .map((subcategory) {
                                      return DropdownMenuItem(
                                        value: subcategory,
                                        child: Text(subcategory),
                                      );
                                    }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                            child: AppTextFiled(
                              maxLines: 10,

                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              type: TextInputType.text,
                              controller: descriptionSpecController,
                              hint: 'Enter a description for the item you want',
                              // border: InputBorder.none,

                              validate: (val) {
                                if (val == null) {
                                  return 'this field is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      )
                    : const SizedBox(
                        height: 5,
                      ),
                BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 25,
                      height: MediaQuery.of(context).size.height * .052,
                      color: AppColors.primaryColor,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // PostCubit.get(context).uploadFile(
                            //   name: itemNameController.text,
                            //   category: _selectedCategory!,
                            //   subCategory: _selectedSubcategory!,
                            //   disc: descriptionController.text,
                            //   // userName: CacheHelper.getData(
                            //   //     key: Constant.kUserName),
                            // );
                            if (selection == 1) {
                              // PostCubit.get(context).uploadSpecificFile(
                              //     name: itemNameSpecController.text,
                              //     category: _selectedSpecCategory ?? '',
                              //     subCategory: _selectedSpecSubcategory ?? '',
                              //     disc: descriptionSpecController.text);
                            }

                            itemNameController.clear();
                            descriptionController.clear();
                            itemNameSpecController.clear();
                            descriptionSpecController.clear();
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
