import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';

import '../widgets/category_list_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      AppCubit cubit = context.read<AppCubit>();
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: ListView.separated(
            controller: controller,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Row(
                  children: [
                    CategoryListItem(
                        categoryModel:
                            cubit.categoriesModel!.data!.categories[index]),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: cubit.categoriesModel!.data!.categories.length),
      );
    });
  }
}
