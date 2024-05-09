import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  int selectedIndex = 0;

  void changeIndexOfNavBar(index) {
    if (index != selectedIndex) {
      selectedIndex = index;
      emit(LayoutChangeBottomNavState());
    }
  }

  void navigatTOHome() {
    selectedIndex = 0;
    emit(NavigatTOHomeState());
  }
}
