import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "EcoTrack",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Column(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailTxtController,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                TextField(
                  controller: passwordTxtController,
                  decoration: InputDecoration(
                    label: Text("Senha"),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
