import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/widgets/search_widget.dart';

import '../widgets/shop_text_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppCubit(InitialAppState()),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: ((context, state) {
            AppCubit cubit = context.read<AppCubit>();
            if (state is LoadingState) {
              return const Center(
                child: SizedBox(width: 200, child: LinearProgressIndicator()),
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ShopTextField(
                          prefix: const Icon(Icons.search),
                          controller: searchController,
                          label: 'Search',
                          submitt: (value) {
                            if (value!.isNotEmpty) {
                              cubit.searchProduct(value);
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        cubit.searchModel == null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.40,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Try to search about something",
                                    ),
                                  ),
                                ],
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.all(8.0),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => SearchWidget(
                                  model: cubit.searchModel!.data!.data[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: cubit.searchModel!.data!.data.length,
                              ),
                      ],
                    )),
              ),
            );
          }),
        ),
      ),
    );
  }
}
