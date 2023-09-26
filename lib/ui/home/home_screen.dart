import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final user = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: const Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text("Home"),
              Text("Page"),
          /*  Row(
              children: [
                Text("User Id   :"),
                Text(user.currentUser!.uid)
              ],
            ),
            Row(
              children: [
                Text("Email    :"),
                Text(user.currentUser!.email.toString())
              ],
            ),
            Row(
              children: [
                Text(""),
                Text(user.currentUser!.providerData.toString())
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
