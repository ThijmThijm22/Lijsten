import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? 'Registreer of Log In' : user.email.toString()),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password'
              ),
            ),

            // register- login buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Registreer'),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } on FirebaseAuthException catch(err) {
                      print(err);
                    }
                    setState(() {});
                  },
                ),

                ElevatedButton(
                  child: Text('  Log In  '),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } on FirebaseAuthException catch(err) {
                      print(err);
                    }
                    setState(() {});
                    print("user uid: $user");
                  },
                ),

                ElevatedButton(
                  child: Text('  Log Out '),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                    } on FirebaseAuthException catch(err) {
                      print(err);
                    }
                    emailController.clear();
                    passwordController.clear();
                    setState(() {});
                  },
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(' Lijstjes '),
            )
          ],
        ),
        ),
      );
  }
}