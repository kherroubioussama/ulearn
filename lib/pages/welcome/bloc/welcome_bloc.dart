

import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial(page: 0)) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeInitial(page: state.page));
    });
  }
}
