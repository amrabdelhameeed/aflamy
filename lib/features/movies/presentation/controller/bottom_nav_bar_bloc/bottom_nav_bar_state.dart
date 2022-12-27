part of 'bottom_nav_bar_bloc.dart';

class ChangeBottomNavBarState extends Equatable {
  const ChangeBottomNavBarState({this.index = 0});
  final int index;
  ChangeBottomNavBarState copyWith({int? index}) {
    return ChangeBottomNavBarState(index: index ?? this.index);
  }

  @override
  List<Object?> get props => [index];
}
