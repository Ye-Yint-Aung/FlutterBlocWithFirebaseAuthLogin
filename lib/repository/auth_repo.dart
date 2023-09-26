

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo{
  AuthRepo();

  final _auth = FirebaseAuth.instance;

  Future<String> registerUser(String email, String password) async{
    try{
       await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "SUCCESS";
    }on FirebaseAuthException catch(e){
        print("ERROR>>>>>>>>>>> ${e.code}");
        return e.code;
    }
  }

  signInUser(String email, String password) async{
    try{

    }on FirebaseAuthException catch(e){
      print(e.code);
    }
  }



}