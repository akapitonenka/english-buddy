import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:english_buddy/screens/wrapper.dart';
import 'package:english_buddy/screens/auth/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Authenticate();
        }

        return Text('loading');
      },
    ),  
    );
  }
}
