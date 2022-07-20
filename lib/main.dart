import 'package:flutter/material.dart';
import 'package:pdp_prefdemo/pages/login_page.dart';
import 'package:pdp_prefdemo/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoginPage.id: (_) => const LoginPage(),
        RegisterPage.id: (_) => const RegisterPage(),
      },
      home: const LoginPage(),
    );
  }
}
