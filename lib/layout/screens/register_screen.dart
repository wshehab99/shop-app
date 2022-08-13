import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/screens/shop_layout.dart';

import '../../shared/local/cache_helper.dart';
import '../widgets/shop_button.dart';
import '../widgets/shop_text_field.dart';
import '../widgets/toast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnofPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(listener: ((context, state) {
        if (state is LoginSuccessState) {
          if (state.model.status!) {
            CacheHelper.saveData(
              key: "token",
              value: state.model.userData!.token,
            ).then((value) {
              if (value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ShopLayout()));
              }
            });
          } else {
            AppToast.showToast(message: state.model.message!);
          }
        }
      }), builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
          ),
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
                          "Register",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Register to our platform to browse hot offers",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ShopTextField(
                          type: TextInputType.name,
                          label: 'name',
                          prefix: const Icon(Icons.person),
                          controller: nameController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
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
                          height: 20,
                        ),
                        ShopTextField(
                          isPassword: context.read<AppCubit>().showPassword,
                          type: TextInputType.emailAddress,
                          label: 'Password',
                          prefix: const Icon(Icons.lock),
                          controller: passwordController,
                          suffix: IconButton(
                            onPressed: () {
                              context.read<AppCubit>().passwordPressed();
                            },
                            icon: context.read<AppCubit>().showPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          validate: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ShopTextField(
                          isPassword: context.read<AppCubit>().showPassword,
                          type: TextInputType.emailAddress,
                          label: 'Confirm Password',
                          prefix: const Icon(Icons.lock),
                          controller: cnofPasswordController,
                          suffix: IconButton(
                            onPressed: () {
                              context.read<AppCubit>().passwordPressed();
                            },
                            icon: context.read<AppCubit>().showPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          validate: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'Password is too short';
                            } else if (cnofPasswordController.text !=
                                passwordController.text) {
                              return 'Password not valid';
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
                                text: "REGISTER",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AppCubit>().register(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text,
                                          phone: phoneController.text,
                                        );
                                  }
                                }),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      })),
    );
  }
}
