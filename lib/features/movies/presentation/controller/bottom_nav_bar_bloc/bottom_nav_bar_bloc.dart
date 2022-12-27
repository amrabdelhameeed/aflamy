import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc
    extends Bloc<BottomNavBarEvent, ChangeBottomNavBarState> {
  BottomNavBarBloc() : super(const ChangeBottomNavBarState()) {
    on<ChangeBottomNavBarEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
