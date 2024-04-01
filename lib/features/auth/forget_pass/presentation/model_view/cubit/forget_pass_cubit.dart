// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:barter_app/features/auth/forget_pass/data/repo/foreget_pass_repo.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(
    this._forgetPassRepo,
  ) : super(ForgetPassInitial());

  final ForgetPassRepo _forgetPassRepo;
  // late String email;
  void emitForgetPassStates({required String email}) async {
    // this.email = email;
    emit(ForgetPassLoadingState());
    final response = await _forgetPassRepo.forgetPassword(email);
    response.fold((error) {
      emit(ForgetPassErrorState(error: error));
      debugPrint(error.toString());
    }, (foregetResponse) {
      emit(ForgetPassSuccessState());
    });
  }

  void verifyResetCode({required String resetCode}) async {
    emit(VerifyResetCodeLoadingState());
    final response = await _forgetPassRepo.verifyResetCode(resetCode);

    response.fold((error) {
      emit(VerifyResetCodeErrorState(error: error));
      debugPrint(error);
    }, (r) {
      emit(VerifyResetCodeSuccessState());
    });
  }

  void resetPassword({required String email, required String pass}) async {
    emit(ResetPasswordLoadingState());
    final response = await _forgetPassRepo.resetPassword(email, pass);
    response.fold((error) {
      emit(ResetPasswordErrorState(error: error));
    }, (r) {
      emit(ResetPasswordSuccessState());
    });
  }
}
