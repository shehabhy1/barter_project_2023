import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostCubitInitial());
  bool isVisible = false;

  void visability(bool val) {
    isVisible = val;
    emit(VisabilityState(val));
  }
}
