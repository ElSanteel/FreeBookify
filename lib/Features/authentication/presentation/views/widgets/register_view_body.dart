import 'package:book_store_app/Features/authentication/data/models/register_request_model.dart';
import 'package:book_store_app/Features/authentication/presentation/manager/login_cubit.dart';
import 'package:book_store_app/Features/authentication/presentation/manager/register_cubit.dart';
import 'package:book_store_app/Features/authentication/presentation/views/login_view.dart';
import 'package:book_store_app/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/size_config.dart';
import 'package:book_store_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is UserRegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Register Successful')),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginView()),
            (route) => false,
          );
        } else if (state is UserRegisterErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.registerErrorMessage)),
          );
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Form(
          key: cubit.registerFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: SizeConfig.screenWidth! * 0.5,
                    height: SizeConfig.screenHeight! * 0.2,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Enter your name",
                    controller: cubit.registerNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.mail),
                    labelText: "Enter your email",
                    controller: cubit.registerEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Please Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Enter your phone",
                    controller: cubit.registerPhoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone is required';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Phone must contain only numeric values (0-9)';
                      }
                      if (value.startsWith('-')) {
                        return 'Phone cannot be a negative value';
                      }
                      return null;
                    },
                    isNumeric: true,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: !cubit.isVisiblePassword,
                    suffixIcon: IconButton(
                      icon: Icon(cubit.isVisiblePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        cubit.registerTogglePasswordVisibility();
                      },
                    ),
                    labelText: "Enter your password",
                    controller: cubit.registerPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                    },
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(cubit.isVisibleConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        cubit.registerToggleConfirmPasswordVisibility();
                      },
                    ),
                    labelText: "Confirm your Password",
                    obscureText: !cubit.isVisibleConfirmPassword,
                    controller: cubit.registerConfirmationPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value !=
                          cubit.registerConfirmationPasswordController.text) {
                        return 'Password don`t match';
                      }
                    },
                  ),
                  RadioListTile(
                      title: const Text('Male'),
                      value: 0,
                      groupValue: cubit.selectedGender,
                      onChanged: cubit.setSelectedGenderChanged),
                  RadioListTile(
                      title: const Text('Female'),
                      value: 1,
                      groupValue: cubit.selectedGender,
                      onChanged: cubit.setSelectedGenderChanged),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    height: SizeConfig.screenHeight! * 0.06,
                    child: state is UserLoginLoadingState
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            backgroundColor: kPrimaryColor,
                            textColor: kSecondaryColor,
                            text: "Register",
                            onPressed: () {
                              if (cubit.registerFormKey.currentState!
                                  .validate()) {
                                if (cubit.registerPasswordController.text !=
                                    cubit.registerConfirmationPasswordController
                                        .text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Passwords do not match'),
                                    ),
                                  );
                                } else {
                                  RegisterRequestModel registerRequestModel =
                                      RegisterRequestModel(
                                    email: cubit.registerEmailController.text,
                                    password:
                                        cubit.registerPasswordController.text,
                                    name: cubit.registerNameController.text,
                                    phone: cubit.registerPhoneController.text,
                                    passwordConfirmation:
                                        cubit.registerPasswordController.text,
                                    gender: cubit.selectedGender,
                                  );
                                  cubit.userRegister(registerRequestModel);
                                }
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
