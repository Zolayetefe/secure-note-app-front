import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const SecureNotesApp());
}

class SecureNotesApp extends StatelessWidget {
  const SecureNotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
      
    );
  }
}
