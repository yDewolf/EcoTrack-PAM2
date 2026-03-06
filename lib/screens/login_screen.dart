import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              // Container(
              //   height: 500,
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.bottomCenter,
              //       end: Alignment.topCenter,
              //       colors: [
              //         const Color.fromARGB(145, 76, 175, 79),
              //         const Color.fromARGB(0, 76, 223, 106),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 50,
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
                      child: Column(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () => {print("Login")},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => {print("Esqueci")},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text(
                                  "Esqueci minha senha",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
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
