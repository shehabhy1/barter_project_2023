part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutChangeBottomNavState extends LayoutState {}

class NavigatToNotificationView extends LayoutState {}
