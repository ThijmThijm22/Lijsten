import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lijstjes',
          style: TextStyle(
            letterSpacing: 2,
          )
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: Container(
        child: Center(
          child: ListView(
            children: [
              
            ],
          )
        )
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new_list');
        },
        child: Icon(Icons.add),
        elevation: 0,
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.cyanAccent,
        child: Text(
          'Dit is vultext, het is text waarmee je uw demo\'s kan opvullen.',
          style: TextStyle(
            fontSize: 30,
            ),
          ),
      ),
    );
  }
}