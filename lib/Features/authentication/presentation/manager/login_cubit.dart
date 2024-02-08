import 'dart:convert';

import 'package:book_store_app/Features/authentication/data/models/login_request_model.dart';
import 'package:book_store_app/Features/authentication/data/models/login_response_model.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/api_end_points.dart';
import 'package:book_store_app/core/utils/dio_helper.dart';
import 'package:book_store_app/core/utils/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  var loginFormKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool isVisible = true;

  void loginTogglePasswordVisibility() {
    isVisible = !isVisible;
    emit(LoginPasswordVisibilityChangedState(isVisible));
  }

  void userLogin(LoginRequestModel loginRequestModel) {
    emit(UserLoginLoadingState());
    print("Loading");
    DioHelper.postData(url: postUserLogin, data: loginRequestModel.toJson())
        .then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        var jsonData = jsonDecode(value.data);
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonData);
        SharedPreferenceHelper.saveData(
            key: userTokenKey, value: loginResponseModel.data!.token!);
        SharedPreferenceHelper.saveData(
            key: userNameTokenKey, value: loginResponseModel.data!.username!);
        print(loginResponseModel.data!.token!);
        emit(UserLoginSuccessState());
      } else {
        var jsonData = jsonDecode(value.data);
        print(jsonData);
        emit(UserLoginErrorState(jsonData['data'].toString()));
      }
    }).catchError((onError) {
      emit(UserLoginErrorState(onError.toString()));
    });
  }
}
