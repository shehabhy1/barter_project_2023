import 'package:barter_project_2023/constants.dart';
import 'package:barter_project_2023/core/helper/hundle_size_helper.dart';
import 'package:barter_project_2023/core/shared_widget/default_text.dart';
import 'package:barter_project_2023/features/add%20post/presentation/view_model/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// what is that ????????????????????????????
//عايزين شويه كاتشب -_-
void main() => runApp(const CustomDropList());

class CustomDropList extends StatefulWidget {
  const CustomDropList({super.key});

  @override
  _CustomDropListState createState() => _CustomDropListState();
}

class _CustomDropListState extends State<CustomDropList> {
  String? _selectedCategory;
  String? _selectedSubcategory;
  String? _selectedSpecCategory;
  String? _selectedSpecSubcategory;

  Map<String, List<String>>? _subcategoryOptions;
  @override
  void initState() {
    super.initState();

    _categoryOptions = BlocProvider.of<PostCubit>(context).categoryOptions;
    _subcategoryOptions =
        BlocProvider.of<PostCubit>(context).subcategoryOptions;
  }

  List<String>? _categoryOptions;
  bool selectYes = true;
  int selection = 0;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController itemNameSpecController = TextEditingController();
  TextEditingController descriptionSpecController = TextEditingController();
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
                  items: _categoryOptions!.map((category) {
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
                      : _subcategoryOptions![_selectedCategory]!
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
              // TODO: from here start the code end on Line 535
              // this must be a separate widget to reduce this huge num of lines
              // and it must be using bloc
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
                      ? BlocBuilder<PostCubit, PostState>(
                          builder: (context, state) {
                            var cubit = PostCubit.get(context);
                            return Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: GestureDetector(
                                        onTap: () {
                                          cubit.getSpecifictProductImage();
                                        },
                                        child: Container(
                                            height: context.deviceHeight * 0.30,
                                            width: context.deviceWidth * .9,
                                            decoration: ShapeDecoration(
                                              image: const DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  'assets/images/add_post.png',
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 1,
                                                    color: Color(0xFF8B8B8B)),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                            //add file here
                                            child: cubit.specFile == null
                                                ? null
                                                : Image(
                                                    image: FileImage(
                                                        cubit.specFile!),
                                                    height:
                                                        context.deviceHeight *
                                                            0.30,
                                                    width: context.deviceWidth *
                                                        .9,
                                                    fit: BoxFit.fill,
                                                  )),
                                      ),
                                    ),
                                    //TODO: make this icon responsive
                                    //To remove image
                                    if (cubit.specFile != null)
                                      Positioned(
                                        left: 280,
                                        bottom: 180,
                                        child: IconButton(
                                            onPressed: () {
                                              cubit.removeSpecImage();
                                            },
                                            icon: const Icon(
                                              Icons.cancel_outlined,
                                              color: Constant.primaryColor,
                                              size: 30,
                                            )),
                                      )
                                  ],
                                ),
                                SizedBox(height: 10),
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
                                    defaultTextField(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        type: TextInputType.text,
                                        controller: itemNameSpecController,
                                        hint: 'Enter Your Item Name',
                                        // border: InputBorder.none,

                                        validate: (val) {
                                          if (val.isEmpty) {
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
                                        border:
                                            Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: DropdownButtonFormField(
                                        value: _selectedSpecCategory,
                                        onChanged: (String? newValue) {
                                          setState(
                                            () {
                                              _selectedSpecCategory =
                                                  newValue;
                                              _selectedSpecSubcategory = null;
                                            },
                                          );
                                        },
                                        decoration: const InputDecoration(
                                          labelText: 'Category',
                                          border: InputBorder.none,
                                        ),
                                        items:
                                            _categoryOptions!.map((category) {
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                              _selectedSpecSubcategory =
                                                  newValue;
                                            });
                                          },
                                    decoration: const InputDecoration(
                                      labelText: 'SubCategory',
                                      border: InputBorder.none,
                                    ),
                                    items: (_selectedSpecCategory == null)
                                        ? null
                                        : _subcategoryOptions![
                                                _selectedSpecCategory]!
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
                                  child: defaultTextField(
                                    maxLines: 10,

                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    type: TextInputType.text,
                                    controller: descriptionSpecController,
                                    hint:
                                        'Enter a description for the item you want',
                                    // border: InputBorder.none,

                                    validate: (val) {
                                      if (val.isEmpty) {
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
                            );
                          },
                        )
                      : const SizedBox(
                          height: 5,
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
                                // userName: CacheHelper.getData(
                                //     key: Constant.kUserName),
                              );
                              if (selection == 1) {
                                PostCubit.get(context).uploadSpecificFile(
                                    name: itemNameSpecController.text,
                                    category: _selectedSpecCategory ?? '',
                                    subCategory: _selectedSpecSubcategory ?? '',
                                    disc: descriptionSpecController.text);
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
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
/* 
/* Padding(
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
                    ), */
                   /*  const SizedBox(width: 10),
                    const Icon(Icons.check_circle_outline), */
 */
