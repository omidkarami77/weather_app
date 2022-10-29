part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadCwEvent extends HomeEvent {
  String cityName;

  LoadCwEvent(this.cityName);
}

class LoadFwEvent extends HomeEvent {
  ForeCastParams param;

  LoadFwEvent(this.param);
}
