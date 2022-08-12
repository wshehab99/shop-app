import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_cubit.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/layout/screens/register_screen.dart';
import 'package:shop_app/layout/widgets/shop_button.dart';
import 'package:shop_app/layout/widgets/shop_text_button.dart';
import 'package:shop_app/layout/widgets/shop_text_field.dart';
import 'package:shop_app/layout/widgets/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(listener: ((context, state) {
        if (state is LoginSuccessState) {
          AppToast.showToast(message: state.model.message!);
        }
      }), builder: (context, state) {
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
                          "LOGIN",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "login to our platform to browse hot offers",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 15,
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
                          height: 30,
                        ),
                        (state is LoadingState)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ShopButton(
                                text: "LOGIN",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AppCubit>().login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                  }
                                }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            ShopTextButton(
                                text: "register now",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                }),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
