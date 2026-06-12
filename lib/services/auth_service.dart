import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registrarUsuario({
    required String nome,
    required String sobrenome,
    required String email,
    required String telefone,
    required String senha,
    required String confirmarsenha,
  }) async {
    //tratamento de Exceções
    try {
      UserCredential credencial = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      String uid = credencial.user!.uid;

      await _firestore.collection('usuarios').doc(uid).set({
        'nome': nome,
        'sobrenome': sobrenome,
        'email': email,
        'telefone': telefone,
        'senha': senha,
        'confirmarsenha': confirmarsenha,
      });

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Este e-mail já está cadastrado';
      } else if (e.code == 'weak-password') {
        return 'A senha é muito fraca';
      } else if (e.code == 'invalid-email') {
        return 'E-mail inválido';
      }
      return 'Erro no cadastro ${e.message} ${e.code}';
    } catch (e) {
      return 'Erro inesperado $e';
    }
  }

  Future<String?> login({
    required String email,
    required String password
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password provided.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is badly formatted.";
      } else if (e.code == 'user-disabled') {
        errorMessage = "This user account has been disabled.";
      }

      return errorMessage;
    } catch (e) {
      return ("Unexpected error occurred." + e.toString());
    }
  }
}
