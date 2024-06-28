import 'package:barter_app/features/auth/forget_pass/presentation/model_view/cubit/forget_pass_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:barter_app/features/auth/forget_pass/data/repo/foreget_pass_repo.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final ForgetPassRepo _forgetPassRepo;
  ForgetPassCubit(this._forgetPassRepo) : super(ForgetPassInitial());

  final forgetKey = GlobalKey<FormState>();
  final verifyKey = GlobalKey<FormState>();
  final resetKey = GlobalKey<FormState>();

  late final TextEditingController verifyEmailController =
      TextEditingController();
  late final TextEditingController newPassController = TextEditingController();

  String? codeOtp;

  void emitForgetPassStates() async {
    emit(ForgetPassLoadingState());
    final response =
        await _forgetPassRepo.forgetPassword(verifyEmailController.text);
    response.fold((error) {
      emit(ForgetPassErrorState(error: error));
      debugPrint(error.toString());
    }, (foregetResponse) {
      emit(ForgetPassSuccessState());
    });
  }

  void verifyResetCode() async {
    emit(VerifyResetCodeLoadingState());
    final response = await _forgetPassRepo.verifyResetCode(codeOtp!);

    response.fold((error) {
      emit(VerifyResetCodeErrorState(error: error));
      debugPrint(error);
    }, (r) {
      emit(VerifyResetCodeSuccessState());
    });
  }

  void resetPassword({required String email}) async {
    emit(ResetPasswordLoadingState());
    final response =
        await _forgetPassRepo.resetPassword(email, newPassController.text);
    response.fold((error) {
      emit(ResetPasswordErrorState(error: error));
    }, (r) {
      emit(ResetPasswordSuccessState());
    });
  }

  void validateThenDoForgetPassword() {
    if (forgetKey.currentState!.validate()) {
      emitForgetPassStates();
    }
  }

  void validateThenDoVerifyResetCode() {
    if (verifyKey.currentState!.validate()) {
      verifyResetCode();
    }
  }

  void validateThenDoResetPassword(String email) {
    if (resetKey.currentState!.validate()) {
      resetPassword(email: email);
    }
  }
}
