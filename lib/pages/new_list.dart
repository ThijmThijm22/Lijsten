import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NewList extends StatelessWidget {
  const NewList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lijstje Aanmaken'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Titel',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: titleController,
            ),

            SizedBox(height: 50),

            Text(
              'Beschrijving',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: descriptionController,
            ),

            SizedBox(height: 60),

            ElevatedButton(
              onPressed: () {
                print(user?.uid);
                FirebaseFirestore.instance.collection(user!.uid.toString()).add({
                  'titel': titleController.text,
                  'beschrijving': descriptionController.text,
                });
              },

              child: Text('Press Me!'),
            )
          ],
        ),
      ),
    );
  }
}