// screens/login_screen.dart
import 'package:ecotrack/screens/home_screen.dart';
import 'package:ecotrack/screens/register_screen.dart';
import 'package:ecotrack/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  // Validar login:
  void validateLogin() {
    if (_formKey.currentState!.validate()) {
      String email = this.emailTxtController.text;
      String password = this.passwordTxtController.text;

      Future<String?> result = this.authService.login(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 20,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 400,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  const Color.fromARGB(145, 76, 175, 79),
                                  const Color.fromARGB(0, 76, 223, 106),
                                ],
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            height: double.infinity,
                            "horizontal_logo.svg",
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          spacing: 30.0,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: emailTxtController,
                              decoration: InputDecoration(
                                label: Text("Email"),
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "You should fill email field";
                                }
                              },
                            ),
                            TextFormField(
                              controller: passwordTxtController,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                label: Text("Senha"),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "You should fill password field";
                                }

                                if (value.length < 6) {
                                  return "Password should have at least 6 characters";
                                }

                                return null;
                              },
                            ),
                            Column(
                              spacing: 10,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => validateLogin(),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "Entrar",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      ),
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "Criar Conta",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
