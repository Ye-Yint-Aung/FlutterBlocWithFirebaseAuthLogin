part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  //Post? post;
  List<dynamic> post;

  HomeSuccessState({required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

class HomeErrorState extends HomeState {
  String errorMessage;

  HomeErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}