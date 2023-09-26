part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AuthLoadingState extends AuthState {
 // String loadingMessage;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AuthErrorState extends AuthState {
  String? errorMessage;
  AuthErrorState({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
 }
class AuthSuccessState extends AuthState {
  String successMessage;
  AuthSuccessState({required this.successMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [successMessage];

}
