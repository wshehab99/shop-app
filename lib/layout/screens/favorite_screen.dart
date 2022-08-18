import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/widgets/favorite_list_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: ((context, state) {
        AppCubit cubit = context.read<AppCubit>();
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          controller: controller,
          padding: const EdgeInsets.all(8.0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => FavoriteListWidget(
            model: cubit.favorites[index],
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: cubit.favorites.length,
        );
      }),
    );
  }
}
