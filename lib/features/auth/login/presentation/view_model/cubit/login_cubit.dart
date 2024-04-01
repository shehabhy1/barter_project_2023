import 'package:barter_app/features/auth/login/data/repo/login_repo.dart';
import 'package:barter_app/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void emitLoginStates({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final responose = await _loginRepo.login(email: email, password: password);
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
}
