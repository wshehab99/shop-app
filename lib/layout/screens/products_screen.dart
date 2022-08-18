import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/widgets/categoty_list_widget.dart';
import 'package:shop_app/layout/widgets/product_grid_widget.dart';
import 'package:shop_app/layout/widgets/shop_slider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
    this.controller,
  }) : super(key: key);
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      AppCubit cubit = context.read<AppCubit>();
      if (state is LoadingState ||
          cubit.productModel == null ||
          cubit.categoriesModel == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SingleChildScrollView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopSlider(
                items: cubit.productModel!.data!.banners
                    .map((e) => Image(
                          image: NetworkImage(e.image!),
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              CategoryListWidget(
                  items: cubit.categoriesModel!.data!.categories),
              const SizedBox(
                height: 10.0,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                childAspectRatio: 1.0 / 1.518,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                  cubit.productModel!.data!.products.length,
                  (index) => ProductGridWidget(
                    model: cubit.productModel!.data!.products[index],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
