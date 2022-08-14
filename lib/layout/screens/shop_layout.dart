import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/screens/categories_screen.dart';
import 'package:shop_app/layout/screens/favorite_screen.dart';
import 'package:shop_app/layout/screens/products_screen.dart';
import 'package:shop_app/layout/screens/search_screen.dart';
import 'package:shop_app/layout/screens/settings_screen.dart';
import 'package:shop_app/layout/widgets/nav_bar_widget.dart';

class ShopLayout extends StatelessWidget {
  ShopLayout({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  List<Widget> screens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    screens = [
      ProductsScreen(controller: _controller),
      const CategoriesScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];
    return BlocProvider(
        create: (context) => AppCubit(InitialAppState())..getProducts(),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: ((context, state) {
            AppCubit cubit = context.read<AppCubit>();
            return Scaffold(
              bottomNavigationBar: NavBarWidget(
                index: cubit.currentIndex,
                onTap: (value) {
                  if (value == 0 && value == cubit.currentIndex) {
                    _controller.animateTo(
                      _controller.position.minScrollExtent,
                      duration: const Duration(seconds: 1, milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                  cubit.changeBottomNavIndex(value);
                },
              ),
              appBar: AppBar(
                  iconTheme: Theme.of(context).iconTheme,
                  title: const Text('Salla'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        icon: const Icon(Icons.search))
                  ]),
              body: screens[cubit.currentIndex],
            );
          }),
        ));
  }
}
