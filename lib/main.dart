import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman login
import 'pemesanan.dart'; // Import halaman login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginApp(),
        '/travel': (context) => const TravelApp(),
      },
    );
  }
}
