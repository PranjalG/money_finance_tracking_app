part of 'base_bloc.dart';

sealed class BaseState extends Equatable {
  const BaseState();
}

final class BaseInitial extends BaseState {
  @override
  List<Object> get props => [];
}
