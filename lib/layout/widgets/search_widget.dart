import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/widgets/toast.dart';
import 'package:shop_app/models/search_model.dart';

import '../../cubit/app_cubit.dart';
import '../../cubit/app_states.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.model}) : super(key: key);
  final SearchProduct model;
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = context.read<AppCubit>();
    return BlocConsumer<AppCubit, AppStates>(listener: ((context, state) {
      if (state is ChangeFavoritesSuccessState) {
        AppToast.showToast(message: cubit.favoritesModel!.message!);
      }
    }), builder: (context, state) {
      return SizedBox(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(model.image!),
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    model.name!,
                    style: const TextStyle(
                      fontSize: 14,
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price!}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Add to favoorites',
                        iconSize: 30,
                        padding: EdgeInsets.zero,
                        color: Colors.red.shade100,
                        onPressed: () {
                          cubit.changeFavorite(productId: model.id!);
                        },
                        icon: model.isFavorites!
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red[400],
                              )
                            : const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
