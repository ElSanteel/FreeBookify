import 'package:book_store_app/Features/authentication/data/models/register_request_model.dart';
import 'package:book_store_app/Features/authentication/presentation/manager/login_cubit.dart';
import 'package:book_store_app/Features/authentication/presentation/manager/register_cubit.dart';
import 'package:book_store_app/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:book_store_app/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is UserRegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Register Successful')),
            );
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(
            //       builder: (BuildContext context) => const LoginView()),
            //   (route) => false,
            // );
            GoRouter.of(context).push(AppRouter.kLoginView);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 350,
                          height: 200,
                        ),
                      ],
                    ),
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
                      obscureText: !cubit.isVisible,
                      suffixIcon: IconButton(
                        icon: Icon(cubit.isVisible
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
                        icon: Icon(cubit.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          cubit.registerTogglePasswordVisibility();
                        },
                      ),
                      labelText: "Confirm your Password",
                      obscureText: !cubit.isVisible,
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
                    Center(
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: state is UserLoginLoadingState
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff3abdd7)),
                                onPressed: () {
                                  if (cubit.registerFormKey.currentState!
                                      .validate()) {
                                    if (cubit.registerPasswordController.text !=
                                        cubit
                                            .registerConfirmationPasswordController
                                            .text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Passwords do not match'),
                                        ),
                                      );
                                    } else {
                                      RegisterRequestModel
                                          registerRequestModel =
                                          RegisterRequestModel(
                                        email:
                                            cubit.registerEmailController.text,
                                        password: cubit
                                            .registerPasswordController.text,
                                        name: cubit.registerNameController.text,
                                        phone:
                                            cubit.registerPhoneController.text,
                                        passwordConfirmation: cubit
                                            .registerPasswordController.text,
                                        gender: cubit.selectedGender,
                                      );
                                      cubit.userRegister(registerRequestModel);
                                    }
                                  }
                                },
                                child: const Text('Register'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
