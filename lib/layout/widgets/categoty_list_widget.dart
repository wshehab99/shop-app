import 'package:flutter/material.dart';

import '../../models/categories_model.dart';
import 'category_list_item.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key, required this.items}) : super(key: key);
  final List<CategoryModel> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 120,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    CategoryListItem(categoryModel: items[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: items.length),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Products",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
