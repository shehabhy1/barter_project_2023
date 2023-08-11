
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? _selectedCategory;
  String? _selectedSubcategory;

  final List<String> _categories = [
    'Electronics',
    'Fashion&Cosmetics',
    'Pets',
    'Books',
    'Home',
    'Vehicle',
    'Apartment',
    'Service',
  ];
  final Map<String, List<String>> _subcategories = {
    'Electronics': ['Phones& Tablets','Accessories','Mobile numbers','Gaming HDDs','Photography equipment',],
    'Fashion&Cosmetics': ['Clothes','blogs & Shoes','Cosmetics & Perfumes',],
    'Pets': ['Cats','Dogs','Birds ','Pet supplies or accessories',],
    'Books':[  'Novels & stories','Books',' Newspappers & magazines','School books','Faculty books',],
    'Home':[  'Furniture','Electrical devices','Fabrics-curtains-carpets','Decorations & accessories',],
    'Vehicle':[ 'Vehicles','Motorcycles','Spare parts',],
    'Apartment':['Villas','Lands',],
    'Service':[ 'Cooking','Teaching','Driving','Maintenance','House keeping','Photography',],
  };

  List<DropdownMenuItem<String>> _buildCategoryDropdownItems() {
    return _categories.map((category) {
      return DropdownMenuItem(
        child: Text(category),
        value: category,
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _buildSubcategoryDropdownItems() {
    if (_selectedCategory == null) {
      return [];
    }

    return _subcategories[_selectedCategory]!.map((subcategory) {
      return DropdownMenuItem(
        child: Text(subcategory),
        value: subcategory,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          DropdownButtonFormField(
            value: _selectedCategory,
            items: _buildCategoryDropdownItems(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
                _selectedSubcategory = null;
              });
            },
            decoration: InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField(
            value: _selectedSubcategory,
            items: _buildSubcategoryDropdownItems(),
            onChanged: (value) {
              setState(() {
                _selectedSubcategory = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Subcategory',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
