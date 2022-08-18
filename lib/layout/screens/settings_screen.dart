import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/screens/login_screen.dart';
import 'package:shop_app/layout/widgets/shop_button.dart';
import 'package:shop_app/layout/widgets/shop_text_field.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          AppCubit cubit = context.read<AppCubit>();
          if (state is! LoadingState) {
            nameController.text = cubit.model!.userData!.name!;
            emailController.text = cubit.model!.userData!.email!;
            phoneController.text = cubit.model!.userData!.phone!;
          }
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Profile Details",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ShopTextField(
                            type: TextInputType.emailAddress,
                            label: 'Name',
                            prefix: const Icon(Icons.person),
                            controller: nameController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your full name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ShopTextField(
                            type: TextInputType.emailAddress,
                            label: 'E-mail',
                            prefix: const Icon(Icons.email_outlined),
                            controller: emailController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your e-mail address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ShopTextField(
                            type: TextInputType.phone,
                            label: 'Phone Number',
                            prefix: const Icon(Icons.phone),
                            controller: phoneController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          (state is LoadingState)
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ShopButton(
                                  text: "Save",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.updateUseDetails(data: {
                                        'name': nameController.text,
                                        'email': emailController.text,
                                        'phone': phoneController.text,
                                      });
                                    }
                                  }),
                          const SizedBox(
                            height: 20,
                          ),
                          ShopButton(
                              text: "LogOut",
                              onPressed: () {
                                cubit.logout().then((value) {
                                  if (value) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                          fullscreenDialog: true,
                                        ));
                                  }
                                });
                              }),
                        ]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
