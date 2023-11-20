part of 'welcome_bloc.dart';


abstract class WelcomeState {
  int page;
  WelcomeState({ required this.page });
}

final class WelcomeInitial extends WelcomeState {
  WelcomeInitial({required super.page});
}
