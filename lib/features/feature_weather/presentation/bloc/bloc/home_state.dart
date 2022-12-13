// ignore_for_file: must_be_immutable, unnecessary_this, require_trailing_commas

part of 'home_bloc.dart';

class HomeState extends Equatable {
  CwStatus cwStatus;
  FwStatus fwStatus;

  HomeState({required this.cwStatus, required this.fwStatus});

  HomeState copyWith({CwStatus? newCwStatus, FwStatus? newFwStatus}) {
    return HomeState(
        cwStatus: newCwStatus ?? this.cwStatus,
        fwStatus: newFwStatus ?? this.fwStatus);
  }

  @override
  List<Object?> get props => [
        cwStatus,
        fwStatus,
      ];
}
