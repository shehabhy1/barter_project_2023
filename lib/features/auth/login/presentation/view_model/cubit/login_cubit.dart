import 'package:barter_app/features/auth/login/data/repo/login_repo.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void emitLoginStates() async {
    emit(LoginLoadingState());
    final responose = await _loginRepo.login(
        email: emailController.text, password: passwordController.text);
    responose.fold((errorMsg) {
      emit(LoginErrorState(error: errorMsg));
    }, (loginResponse) {
      emit(LoginSuccessState());
    });
  }

  // response.when(success: (loginResponse) async {
  //   await CacheHelper.saveString(
  //       key: Constants.kUserToken, value: loginResponse.token);
  //   emit(LoginState.success(loginResponse));
  //   debugPrint('token : =>>>>> ${loginResponse.token}');
  // }, failure: (error) {
  //   emit(LoginState.error(error: error.apiErrorModel.message!));
  // });

  void validateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(ValidateMode());
  }

  void validateThenDoLogin() {
    if (formKey.currentState!.validate()) {
      emitLoginStates();
    } else {
      validateMode();
    }
  }
}
