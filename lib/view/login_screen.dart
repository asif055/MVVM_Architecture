import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVVM'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap:() {
            Navigator.pushNamed(context, RoutesName.home);
          },
          child: Text('CLick me'),
        ),
      ),
    );
  }
}
