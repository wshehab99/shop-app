import 'package:flutter/material.dart';

import '../../models/categories_model.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({Key? key, required this.categoryModel})
      : super(key: key);
  final CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
                height: 120,
                width: 120,
                image: NetworkImage(categoryModel!.image!)),
            const SizedBox(
              width: 5,
            ),
            Text(
              categoryModel!.name!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
