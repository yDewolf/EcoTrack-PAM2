// screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameTxtController = TextEditingController();
  final TextEditingController salaTxtController = TextEditingController();
  final TextEditingController rmTxtController = TextEditingController();
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final List<String> _accountOptions = ["Professor", "Aluno", "Funcionário"];
  String? _selectedOption = null;

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
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
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
                            DropdownButtonFormField(
                              items: _accountOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedOption = newValue;
                                });
                              },
                            ),
                            TextFormField(
                              controller: nameTxtController,
                              decoration: InputDecoration(
                                label: Text("Nome"),
                                prefixIcon: Icon(Icons.label),
                              ),
                            ),
                            TextFormField(
                              controller: rmTxtController,
                              decoration: InputDecoration(
                                label: Text("RM"),
                                prefixIcon: Icon(Icons.numbers),
                              ),
                            ),
                            TextFormField(
                              controller: emailTxtController,
                              decoration: InputDecoration(
                                label: Text("Email"),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField(
                              controller: passwordTxtController,
                              decoration: InputDecoration(
                                label: Text("Senha"),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            Column(
                              spacing: 10,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Text(
                                      "Registrar",
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
