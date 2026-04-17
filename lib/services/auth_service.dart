import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String usuarioCadastrado = "admin@ecotrack.com";
  String senhaCadastrada = "admin0";

  Future<String?> registrarUsuario({
    required String nome,
    required String email,
    required String password,
    required String telefone,
    required String rm,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = credential.user!.uid;
      await _firestore.collection("users").doc(uid).set({
        "name": nome,
        "email": email,
        "password": password,
        "rm": rm,
        "telefone": telefone,
      });

      return null;
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case "email-already-in-use":
          return "Este email já está em uso";
        case "weak-password":
          return "A senha é muito fraca";
        case "invalid-email":
          return "Insira um email válido";
      }
      return "Erro no cadastro ${exception.message}";
    } catch (exception) {
      return "Erro inesperado $exception";
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    return "hii";
  }

  bool register(String email, String password) {
    this.usuarioCadastrado = email;
    this.senhaCadastrada = password;
    return true;
  }
}
