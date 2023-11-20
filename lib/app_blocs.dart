import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearn_bloc_app/app_events.dart';
import 'package:ulearn_bloc_app/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitState()) {
    on<IncrementCounter>((event, ask) {
      ask(AppStates(counter: state.counter + 1));
    });
    on<DecrementCounter>((event, ask) {
      ask(AppStates(counter: state.counter - 1));
    });
  }
}
