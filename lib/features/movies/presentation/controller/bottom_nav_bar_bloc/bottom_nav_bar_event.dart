part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

class ChangeBottomNavBarEvent extends BottomNavBarEvent {
  const ChangeBottomNavBarEvent(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
