import 'package:painscore/app_screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

double _value = 40.0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.tealAccent[200],
            appBar: AppBar(
              toolbarHeight: 190,
              flexibleSpace: ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/back.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text(
                "\n\n\n\You have 2 more\n sessions today",
                maxLines: 20,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              // centerTitle: true,
            ),
            body: FutureBuilder(
              future: _fbApp,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('You have an error! ${snapshot.error.toString()}');
                  return Text('Something went wrong');
                } else if (snapshot.hasData) {
                  return MyHomePage();
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
            // MyHomePage(),
            ));
  }
}
