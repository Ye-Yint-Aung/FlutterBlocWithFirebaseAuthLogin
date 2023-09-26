import 'package:bloc_base/ui/home/home_screen.dart';
import 'package:bloc_base/ui/register/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});


 final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailText = TextEditingController();
    TextEditingController passwordText = TextEditingController();
    late String email;
    late String password;
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: Colors.lightBlueAccent,
          child: SingleChildScrollView(
            child: Column(

              //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child:Text("LOGIN", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                  ),
               Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 50, bottom: 20),
                child: TextFormField(

                  controller: emailText,
                  decoration:const  InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding:const  EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText:true,
                  controller: passwordText,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.amberAccent,
                  elevation: 20,
                  shadowColor: Colors.amber,
                ),
                onPressed: () async{
                  email = emailText.text;
                  password = passwordText.text;
                 try{
                   final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                   print("I am user $user");
                   if(user != null){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>  HomeScreen()));
                     //print ( "User register");
                   }
                 }on FirebaseAuthException catch(e){
                   print ( "Error.........${e.code}");
                   showDialog(
                     context: context,
                     builder: (context) {
                       return AlertDialog(
                         title: Center(child: Text(" Login Failed", textAlign: TextAlign.center)),
                         actions: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               TextButton(
                                 child: Text("Retry"),
                                 onPressed: () {
                                   Navigator.pop(context);
                                 },
                               ),
                             ],
                           )
                         ],
                       );
                     },
                   );
                 }

                },
                child: const Text("LOGIN"),
              ),
              Padding(
                padding:  const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("You don't have account yet?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                    }, child: const Text("Register Now"))
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
