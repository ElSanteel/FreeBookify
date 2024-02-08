import 'package:book_store_app/Features/authentication/data/models/login_request_model.dart';
import 'package:book_store_app/Features/authentication/presentation/manager/login_cubit.dart';
import 'package:book_store_app/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/widgets/custom_button.dart';
import 'package:book_store_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Successful')),
          );
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //       builder: (BuildContext context) =>
          //           const HomeView()),
          //   (route) => false,
          // );
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is UserLoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.loginErrorMessage)),
          );
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return Form(
          key: cubit.loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: SizeConfig.screenWidth! * 0.5,
                  height: SizeConfig.screenHeight! * 0.2,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.92,
                  child: CustomTextField(
                    prefixIcon: const Icon(Icons.mail),
                    labelText: "Enter your Email",
                    controller: cubit.loginEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Email is required';
                      }
                      if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Please Enter a valid email";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.92,
                  child: CustomTextField(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(cubit.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        cubit.loginTogglePasswordVisibility();
                      },
                    ),
                    labelText: "Enter your Password",
                    obscureText: !cubit.isVisible,
                    controller: cubit.loginPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 45),
                Center(
                    child: state is UserLoginLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            width: SizeConfig.screenWidth! * 0.9,
                            height: SizeConfig.screenHeight! * 0.06,
                            backgroundColor: kPrimaryColor,
                            textColor: kSecondaryColor,
                            text: 'Login',
                            onPressed: () {
                              if (cubit.loginFormKey.currentState!.validate()) {
                                LoginRequestModel loginRequestModel =
                                    LoginRequestModel(
                                        cubit.loginEmailController.text,
                                        cubit.loginPasswordController.text);
                                cubit.userLogin(loginRequestModel);
                              }
                            },
                          )),
                const SizedBox(height: 25),
                CustomButton(
                  width: SizeConfig.screenWidth! * 0.9,
                  height: SizeConfig.screenHeight! * 0.06,
                  backgroundColor: kPrimaryColor,
                  textColor: kSecondaryColor,
                  text: 'Register',
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kRegisterView);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
