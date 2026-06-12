import 'package:ecotrack/screens/login_screen.dart';
import 'package:ecotrack/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  void validateRegister() {
    if (_formKey.currentState!.validate()) {
      String email = this.emailController.text;
      String password = this.senhaController.text;
      String telefone = this.telefoneController.text;
      String nome = this.nomeController.text;
      String sobrenome = this.sobrenomeController.text;
      String confirmarsenha = this.confirmarSenhaController.text;

      Future<String?> result = this.authService.registrarUsuario(
        email: email,
        senha: password,
        telefone: telefone,
        nome: nome,
        sobrenome: sobrenome,
        confirmarsenha: confirmarsenha
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Digite seu nome";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: sobrenomeController,
                  decoration: InputDecoration(
                    labelText: "Sobrenome",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder()
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){
                      return "Digite seu e-mail";
                    }

                    if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                      return "Digite um e-mail válido";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder()
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){
                      return "Digite uma senha";
                    }

                    if(value.length < 6){
                      return "Senha deve ter no mínimo 6 caracteres";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: confirmarSenhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirmar Senha",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){

                    if(value != senhaController.text){
                      return "As senhas não coincidem";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),

                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        this.validateRegister();
                      }
                    },

                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 16)
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}