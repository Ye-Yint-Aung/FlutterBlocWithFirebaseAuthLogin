import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_base/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState());

    final repo = AuthRepo();

    void createUserInFireBase(String email, String password) async{
      print("BLOC ${email} and $password");
      emit(AuthLoadingState());
      final response = await repo.registerUser(email, password);
      if(response == "SUCCESS"){
        emit(AuthSuccessState(successMessage: "Success"));
      }else{
        emit(AuthErrorState(errorMessage: response.toString()));
      }

    }



}
